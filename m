Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Thu, 10 Dec 2020 20:58:55 +0100
From: Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] dma-mapping: move hint unlikely for dma_mapping_error
 from drivers to core
Message-ID: <20201210195855.GA11120@kunai>
References: <5d08af46-5897-b827-dcfb-181d869c8f71@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5d08af46-5897-b827-dcfb-181d869c8f71@gmail.com>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0168737732440424236=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Igor Russkikh <irusskikh@marvell.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, GR-everest-linux-l2@marvell.com, Ioana Radulescu <ruxandra.radulescu@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michal Simek <michal.simek@xilinx.com>, Doug Ledford <dledford@redhat.com>, Murali Karicheri <m-karicheri2@ti.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Jiri Pirko <jiri@resnulli.us>, Jesper Dangaard Brouer <hawk@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Arnaud Ebalard <arno@natisbad.org>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Guy Tzalik <gtzalik@amazon.com>, Luis Chamberlain <mcgrof@kernel.org>, linux-crypto@vger.kernel.org, Jon Mason <jdmason@kudzu.us>, Shannon Nelson <snelson@pensando.io>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Chris Snook <chris.snook@gmail.com>, Daniele Venzano <venza@brownhat.org>, Zhu Yanjun <zyjzyj2000@gmail.com>, linux-i2c@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>, Jon Olson <jonolson@google.com>, Arthur Kiyanovski <akiyano@amazon.com>, Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Boris Pismenny <borisp@nvidia.com>, John Fastabend <john.fastabend@gmail.com>, Rain River <rain.1986.08.12@gmail.com>, Martin Habets <habetsm.xilinx@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Wingman Kwok <w-kwok2@ti.com>, Sean Wang <sean.wang@mediatek.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Pensando Drivers <drivers@pensando.io>, Kalle Valo <kvalo@codeaurora.org>, Boris Brezillon <bbrezillon@kernel.org>, Sagi Shahar <sagis@google.com>, Tariq Toukan <tariqt@nvidia.com>, Sudarsana Kalluru <skalluru@marvell.com>, Netanel Belgazal <netanel@amazon.com>, Andreas Larsson <andreas@gaisler.com>, Catherine Sullivan <csully@google.com>, Zaibo Xu <xuzaibo@huawei.com>, Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>, Alexei Starovoitov <ast@kernel.org>, Elie Morisse <syniurge@gmail.com>, Luca Coelho <luciano.coelho@intel.com>, Quan Nguyen <quan@os.amperecomputing.com>, Subbaraya Sundeep <sbhatta@marvell.com>, Jiri Slaby <jirislaby@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, Srujana Challa <schalla@marvell.com>, ath10k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org, b43-dev@lists.infradead.org, Jay Cliburn <jcliburn@gmail.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, John Crispin <john@phrozen.org>, Michael Chan <michael.chan@broadcom.com>, Salil Mehta <salil.mehta@huawei.com>, Edward Cree <ecree.xilinx@gmail.com>, iommu@lists.linux-foundation.org, wil6210@qti.qualcomm.com, Saeed Bishara <saeedb@amazon.com>, bpf@vger.kernel.org, Geetha sowjanya <gakula@marvell.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herbert Xu <herbert@gondor.apana.org.au>, Zorik Machulsky <zorik@amazon.com>, qat-linux@intel.com, Jason Gunthorpe <jgg@ziepe.ca>, Nick Kossifidis <mickflemm@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Nehal Shah <nehal-bakulchandra.shah@amd.com>, Sunil Goutham <sgoutham@marvell.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ariel Elior <aelior@marvell.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, George Cherian <gcherian@marvell.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, hariprasad <hkelam@marvell.com>, Raju Rangoju <rajur@chelsio.com>, Felix Fietkau <nbd@nbd.name>, Saeed Mahameed <saeedm@nvidia.com>, Larry Finger <Larry.Finger@lwfinger.net>


--===============0168737732440424236==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 03:47:50PM +0100, Heiner Kallweit wrote:
> Zillions of drivers use the unlikely() hint when checking the result of
> dma_mapping_error(). This is an inline function anyway, so we can move
> the hint into the function and remove it from drivers.
> From time to time discussions pop up how effective unlikely() is,
> and that it should be used only if something is really very unlikely.
> I think that's the case here.
>=20
> Patch was created with some help from coccinelle.
>=20
> @@
> expression dev, dma_addr;
> @@
>=20
> - unlikely(dma_mapping_error(dev, dma_addr))
> + dma_mapping_error(dev, dma_addr)
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/SffoACgkQFA3kzBSg
KbYcjxAAgOE4gHcgEP8+Oex1fposdP2Z4KiWFjIYYWG4fo/Ry9PjDbSGh9Nptht2
fnsCRcFXFj4oaSXaflBTq6ky4usgo2Gyp9puXbnpyj7P2uEjrqZs1zUFpAWdzMor
UgiJkW/P2IZjCDfwxE8nn9L0fm8ZfcHWqVohAgDh/9SKsrQCdzlzwvd7vSQ94fXr
qnYrmc6BF68dxVZx4TV18GddP5qFXYKytQ8pXL51XZEJTI05IGmc2l6hs/B4tKj6
muxiEFw5Ac0eseMimi4J5YDJJZxWe28onn69mMJYQDzVPqSZRyhSAqCv0EhMg6Vp
sABbG/eShtxir8A5ZrVRgqCaVyBjPu6pHAxdccHkj4d/6hfvD6F2FDXXaWirAf3i
A4gsMJAmxtBYV0Lyx0D+fzCFnvUSDDSOEayRJdzotQXVCbLvuWHTp6EXVJFD5mMU
/o3LApTC1uYQTXfGh1HHanpSEXLXfVgzjuDHRUsVIwemk5JwUAl6fw4oXbMrHYdZ
v9Inx4U81LGxayz1vGmzbE39AeE7YH/5lH4metjot96RpKa+Gg++mMxUHBPW6Jam
AOz6I3cKYsn7mPkzAZfDNvhvfgz2vxXcGGULSCdaWnVCJY7FMqe8i98w1z/Ymo7U
JSXmDUhFS43r0JqUfbR0sRGgLL+kHTEa6I4ZT8UNd9DmTtS0Jmo=
=4X1P
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--


--===============0168737732440424236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============0168737732440424236==--
