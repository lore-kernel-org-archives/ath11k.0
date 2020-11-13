Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
References: <BYAPR02MB4567172F4913F68EE61C7EAC921A0@BYAPR02MB4567.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4567172F4913F68EE61C7EAC921A0@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 13 Nov 2020 10:13:18 -0500
Message-ID: <CA+5PVA5vc-oHRnso3Zo7UByqKx+Eh7KRtc9XgXub_5sqSjdXtw@mail.gmail.com>
Subject: Re: [PULL] ath10k & ath11k firmware 20201023
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>

Pulled and pushed out.

josh

On Fri, Oct 23, 2020 at 11:57 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers,
>
> here's a pull request for ath10k and ath11k drivers. For ath10k there is a
> firmware for new hardware QCA6174 hw3.0 SDIO. For ath11k there are
> firmwares for new hardware IPQ8074 hw2.0, IPQ6018 hw1.0 and QCA6390
> hw2.0. And also few updates for existing hardware.
>
> From previous pull request ath10k-20201022 I fixed the notice files to be
> valid utf-8 and changed CRLF line endings to LF.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:
>
>   ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20201023
>
> for you to fetch changes up to d842d8c5892ea1570eacd01cc274436d1c6e676b:
>
>   ath11k: QCA6390 hw2.0: add to WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1 (2020-10-23 18:42:08 +0300)
>
> ----------------------------------------------------------------
> Kalle Valo (11):
>       ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00157-QCARMSWPZ-1
>       ath10k: QCA6174 hw3.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00131
>       ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00131
>       ath10k: QCA6174 hw3.0: add firmware-sdio-6.bin version WLAN.RMH.4.4.1-00077
>       ath11k: IPQ6018 hw1.0: add board-2.bin
>       ath11k: IPQ6018 hw1.0: add to WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
>       ath11k: IPQ8074 hw2.0: add board-2.bin
>       ath11k: IPQ8074 hw2.0: add to WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
>       ath11k: QCA6390 hw2.0: add board-2.bin
>       ath11k: QCA6390 hw2.0: add to WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
>  WHENCE                                             |   57 +-
>  ath10k/QCA6174/hw3.0/board-2.bin                   |  Bin 584036 -> 633360 bytes
>  ath10k/QCA6174/hw3.0/firmware-6.bin                |  Bin 700988 -> 702844 bytes
>  ath10k/QCA6174/hw3.0/firmware-sdio-6.bin           |  Bin 0 -> 604416 bytes
>  .../hw3.0/notice_ath10k_firmware-sdio-6.txt        | 1352 ++++++++++++++
>  ath10k/QCA9888/hw2.0/firmware-5.bin                |  Bin 688140 -> 691292 bytes
>  ath10k/QCA9984/hw1.0/firmware-5.bin                |  Bin 675948 -> 679288 bytes
>  ath11k/IPQ6018/hw1.0/Notice.txt                    |  786 ++++++++
>  ath11k/IPQ6018/hw1.0/board-2.bin                   |  Bin 0 -> 787208 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b00                     |  Bin 0 -> 148 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b01                     |  Bin 0 -> 6712 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b02                     |  Bin 0 -> 294912 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.flist                   |    3 +
>  ath11k/IPQ6018/hw1.0/m3_fw.mdt                     |  Bin 0 -> 6860 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b00                     |  Bin 0 -> 340 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b01                     |  Bin 0 -> 7000 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b02                     |  Bin 0 -> 4696 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b03                     |  Bin 0 -> 2357712 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b04                     |  Bin 0 -> 370560 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b05                     |  Bin 0 -> 175588 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b07                     |  Bin 0 -> 8936 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b08                     |  Bin 0 -> 409914 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.flist                   |    8 +
>  ath11k/IPQ6018/hw1.0/q6_fw.mdt                     |  Bin 0 -> 7340 bytes
>  ath11k/IPQ8074/hw2.0/Notice.txt                    |  786 ++++++++
>  ath11k/IPQ8074/hw2.0/board-2.bin                   |  Bin 0 -> 1311380 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b00                     |  Bin 0 -> 148 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b01                     |  Bin 0 -> 136 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b02                     |  Bin 0 -> 327680 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.flist                   |    3 +
>  ath11k/IPQ8074/hw2.0/m3_fw.mdt                     |  Bin 0 -> 284 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b00                     |  Bin 0 -> 340 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b01                     |  Bin 0 -> 328 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b02                     |  Bin 0 -> 4696 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b03                     |  Bin 0 -> 2589264 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b04                     |  Bin 0 -> 985504 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b05                     |  Bin 0 -> 387076 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b07                     |  Bin 0 -> 7048 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b08                     |  Bin 0 -> 424524 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.flist                   |    8 +
>  ath11k/IPQ8074/hw2.0/q6_fw.mdt                     |  Bin 0 -> 668 bytes
>  ath11k/QCA6390/hw2.0/Notice.txt                    | 1971 ++++++++++++++++++++
>  ath11k/QCA6390/hw2.0/amss.bin                      |  Bin 0 -> 3609456 bytes
>  ath11k/QCA6390/hw2.0/board-2.bin                   |  Bin 0 -> 58016 bytes
>  ath11k/QCA6390/hw2.0/m3.bin                        |  Bin 0 -> 266684 bytes
>  45 files changed, 4971 insertions(+), 3 deletions(-)
>  create mode 100644 ath10k/QCA6174/hw3.0/firmware-sdio-6.bin
>  create mode 100644 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt
>  create mode 100644 ath11k/IPQ6018/hw1.0/Notice.txt
>  create mode 100644 ath11k/IPQ6018/hw1.0/board-2.bin
>  create mode 100644 ath11k/IPQ6018/hw1.0/m3_fw.b00
>  create mode 100644 ath11k/IPQ6018/hw1.0/m3_fw.b01
>  create mode 100644 ath11k/IPQ6018/hw1.0/m3_fw.b02
>  create mode 100644 ath11k/IPQ6018/hw1.0/m3_fw.flist
>  create mode 100644 ath11k/IPQ6018/hw1.0/m3_fw.mdt
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.b00
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.b01
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.b02
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.b03
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.b04
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.b05
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.b07
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.b08
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.flist
>  create mode 100644 ath11k/IPQ6018/hw1.0/q6_fw.mdt
>  create mode 100644 ath11k/IPQ8074/hw2.0/Notice.txt
>  create mode 100644 ath11k/IPQ8074/hw2.0/board-2.bin
>  create mode 100644 ath11k/IPQ8074/hw2.0/m3_fw.b00
>  create mode 100644 ath11k/IPQ8074/hw2.0/m3_fw.b01
>  create mode 100644 ath11k/IPQ8074/hw2.0/m3_fw.b02
>  create mode 100644 ath11k/IPQ8074/hw2.0/m3_fw.flist
>  create mode 100644 ath11k/IPQ8074/hw2.0/m3_fw.mdt
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.b00
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.b01
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.b02
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.b03
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.b04
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.b05
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.b07
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.b08
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.flist
>  create mode 100644 ath11k/IPQ8074/hw2.0/q6_fw.mdt
>  create mode 100644 ath11k/QCA6390/hw2.0/Notice.txt
>  create mode 100644 ath11k/QCA6390/hw2.0/amss.bin
>  create mode 100644 ath11k/QCA6390/hw2.0/board-2.bin
>  create mode 100644 ath11k/QCA6390/hw2.0/m3.bin
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
