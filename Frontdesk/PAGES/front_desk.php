<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Header -->
    <?php include "../../header.php"; ?>

    <!-- CSS -->
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../CSS/front_desk.css">

    <!-- CSS Components -->
    <link rel="stylesheet" href="../../Assets/CSS/checkbox.css">

    <title>Frontdesk Page</title>
</head>

<body>
    <div id="front_desk_page">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add_CID_modal">
            <iconify-icon icon="ic:round-plus"></iconify-icon>
        </button>
    </div>

    <!-- Add CID Modal -->
    <div class="modal fade" id="add_CID_modal" tabindex="-1" aria-labelledby="add_CID_label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="add_CID_label">Terms of Service</h5>
                </div>
                <div class="modal-body">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam libero possimus expedita officia ea amet placeat, quod nulla pariatur eaque quisquam sed ad, quas sit neque nobis adipisci maxime ab.
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero magni architecto numquam omnis est dolorum exercitationem hic sit atque repellendus id blanditiis eveniet, sint incidunt deserunt, perspiciatis, placeat rerum dolores!
                            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem dicta fuga nihil ex adipisci repudiandae consequuntur repellat nisi. Tempore architecto quae libero magni nobis nihil natus repellat fuga voluptate quaerat.
                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nesciunt voluptatum cum animi voluptates odit sit eum quaerat totam consequuntur necessitatibus eaque, inventore saepe debitis natus cumque quos est repudiandae exercitationem.
                            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsam ullam quaerat itaque accusantium. Distinctio harum dicta unde provident numquam? Eum corporis ex a neque facere ipsa voluptas? Nesciunt, debitis vero.
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum quod debitis quos ab? Tenetur quibusdam fugiat enim eius similique perferendis delectus, fugit officiis saepe nobis iste explicabo doloribus error asperiores.
                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit quibusdam ex optio sunt, quidem praesentium sit doloribus odit. Asperiores ipsa eligendi corrupti corporis est totam minus officiis dolor temporibus iusto!
                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Iste tempore cumque blanditiis aliquid minima consectetur magni at ratione ea ipsa voluptatem aliquam, perferendis unde provident nemo officia possimus exercitationem temporibus.
                            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Soluta a earum impedit ipsam dolor dolore rem quaerat fugiat officiis temporibus alias incidunt similique, ducimus asperiores maiores tenetur ipsum voluptatem tempore.
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis rem ab quam laboriosam assumenda voluptatibus saepe nulla maiores labore suscipit numquam et aperiam soluta doloremque hic, reiciendis laborum repellendus quos!
                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perspiciatis magnam voluptate sapiente culpa tempora quo quae illum perferendis assumenda. Reprehenderit illo doloremque mollitia quod sunt numquam distinctio reiciendis. Soluta, vero!
                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Tempora praesentium vitae illum omnis repellat beatae deserunt enim eum animi dignissimos atque provident, ex nemo eveniet blanditiis velit id labore autem?
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium enim consectetur laudantium, nemo fugiat expedita laboriosam voluptatibus deserunt ipsum velit labore animi odit ab porro doloremque eveniet nesciunt iure error.
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem obcaecati animi voluptatem tenetur odit odio doloribus quae. Deleniti, aut molestiae qui repellat quasi provident repudiandae, aspernatur, distinctio id voluptatibus accusamus.
                            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam illum nostrum quasi pariatur quas veritatis nihil! Eius voluptatem ullam laboriosam quas quos? Nam, modi eum voluptate harum corporis recusandae reprehenderit.
                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Error aliquid illo, harum laboriosam eveniet voluptatum asperiores tenetur doloremque culpa ratione placeat saepe aspernatur soluta minus nulla, neque delectus quae ea!
                            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Doloribus expedita cum quas saepe. Assumenda, commodi harum libero optio iure sint reiciendis deserunt sapiente consequatur dolorum provident? Tempora eos nihil enim.
                        </label>
                    </div>

                    <label class="form-check-label" for="cid_client_full_name">
                        CLIENT FULL NAME:
                    </label>
                    <input class="form-control" id="cid_client_full_name" type="text">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>