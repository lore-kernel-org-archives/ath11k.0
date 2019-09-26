Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDUuW-0005Lj-9d
 for ath11k@lists.infradead.org; Thu, 26 Sep 2019 14:38:28 +0000
Subject: Re: [PATCH] ath11k: change license to BSD 3-clause "Clear"
References: <156950853389.4940.6655233001777613900.stgit@x230>
From: John Crispin <john@phrozen.org>
Message-ID: <ffc3edb2-84db-d3a4-a233-79c7989eaf54@phrozen.org>
Date: Thu, 26 Sep 2019 16:38:14 +0200
MIME-Version: 1.0
In-Reply-To: <156950853389.4940.6655233001777613900.stgit@x230>
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org


On 26/09/2019 16:35, Kalle Valo wrote:
> Change ath11k license from ISC to BSD 3-clause "Clear".
>
> At the same also add a missing SPDX tag to Kconfig.
>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Acked-by: John Crispin <john@phrozen.org>


> ---
>   drivers/net/wireless/ath/ath11k/Kconfig           |    1 +
>   drivers/net/wireless/ath/ath11k/Makefile          |    2 +-
>   drivers/net/wireless/ath/ath11k/ahb.c             |    2 +-
>   drivers/net/wireless/ath/ath11k/ahb.h             |    2 +-
>   drivers/net/wireless/ath/ath11k/ce.c              |    2 +-
>   drivers/net/wireless/ath/ath11k/ce.h              |    2 +-
>   drivers/net/wireless/ath/ath11k/core.c            |    2 +-
>   drivers/net/wireless/ath/ath11k/core.h            |    2 +-
>   drivers/net/wireless/ath/ath11k/debug.c           |    2 +-
>   drivers/net/wireless/ath/ath11k/debug.h           |    2 +-
>   drivers/net/wireless/ath/ath11k/debug_htt_stats.c |    2 +-
>   drivers/net/wireless/ath/ath11k/debug_htt_stats.h |    2 +-
>   drivers/net/wireless/ath/ath11k/debugfs_sta.c     |    2 +-
>   drivers/net/wireless/ath/ath11k/dp.c              |    2 +-
>   drivers/net/wireless/ath/ath11k/dp.h              |    2 +-
>   drivers/net/wireless/ath/ath11k/dp_rx.c           |    2 +-
>   drivers/net/wireless/ath/ath11k/dp_rx.h           |    2 +-
>   drivers/net/wireless/ath/ath11k/dp_tx.c           |    2 +-
>   drivers/net/wireless/ath/ath11k/dp_tx.h           |    2 +-
>   drivers/net/wireless/ath/ath11k/hal.c             |    2 +-
>   drivers/net/wireless/ath/ath11k/hal.h             |    2 +-
>   drivers/net/wireless/ath/ath11k/hal_desc.h        |    2 +-
>   drivers/net/wireless/ath/ath11k/hal_rx.c          |    2 +-
>   drivers/net/wireless/ath/ath11k/hal_rx.h          |    2 +-
>   drivers/net/wireless/ath/ath11k/hal_tx.c          |    2 +-
>   drivers/net/wireless/ath/ath11k/hal_tx.h          |    2 +-
>   drivers/net/wireless/ath/ath11k/htc.c             |    2 +-
>   drivers/net/wireless/ath/ath11k/htc.h             |    2 +-
>   drivers/net/wireless/ath/ath11k/hw.h              |    2 +-
>   drivers/net/wireless/ath/ath11k/mac.c             |    2 +-
>   drivers/net/wireless/ath/ath11k/mac.h             |    2 +-
>   drivers/net/wireless/ath/ath11k/peer.c            |    2 +-
>   drivers/net/wireless/ath/ath11k/peer.h            |    2 +-
>   drivers/net/wireless/ath/ath11k/qmi.c             |    2 +-
>   drivers/net/wireless/ath/ath11k/qmi.h             |    2 +-
>   drivers/net/wireless/ath/ath11k/reg.c             |    2 +-
>   drivers/net/wireless/ath/ath11k/reg.h             |    2 +-
>   drivers/net/wireless/ath/ath11k/rx_desc.h         |    2 +-
>   drivers/net/wireless/ath/ath11k/testmode.c        |    2 +-
>   drivers/net/wireless/ath/ath11k/testmode.h        |    2 +-
>   drivers/net/wireless/ath/ath11k/testmode_i.h      |    2 +-
>   drivers/net/wireless/ath/ath11k/trace.c           |    2 +-
>   drivers/net/wireless/ath/ath11k/trace.h           |    2 +-
>   drivers/net/wireless/ath/ath11k/wmi.c             |    2 +-
>   drivers/net/wireless/ath/ath11k/wmi.h             |    2 +-
>   45 files changed, 45 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
> index 26bf98fa648e..cb8f45b0d995 100644
> --- a/drivers/net/wireless/ath/ath11k/Kconfig
> +++ b/drivers/net/wireless/ath/ath11k/Kconfig
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: BSD-3-Clause-Clear
>   config ATH11K
>           tristate "Qualcomm Technologies 802.11ax chipset support"
>           depends on MAC80211 && HAS_DMA
> diff --git a/drivers/net/wireless/ath/ath11k/Makefile b/drivers/net/wireless/ath/ath11k/Makefile
> index 6b4a5b5a2aa3..a91d75c1cfeb 100644
> --- a/drivers/net/wireless/ath/ath11k/Makefile
> +++ b/drivers/net/wireless/ath/ath11k/Makefile
> @@ -1,4 +1,4 @@
> -# SPDX-License-Identifier: ISC
> +# SPDX-License-Identifier: BSD-3-Clause-Clear
>   obj-$(CONFIG_ATH11K) += ath11k.o
>   ath11k-y += core.o \
>   	    hal.o \
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index e1fee70055a6..9c3f2a581b9c 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
> index 8a6b308d4a6a..bec4dc259aa1 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.h
> +++ b/drivers/net/wireless/ath/ath11k/ahb.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
> index c1b170cf45ba..c9ac5b0472cf 100644
> --- a/drivers/net/wireless/ath/ath11k/ce.c
> +++ b/drivers/net/wireless/ath/ath11k/ce.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
> index b9f8a0b4cd7e..6174eac84410 100644
> --- a/drivers/net/wireless/ath/ath11k/ce.h
> +++ b/drivers/net/wireless/ath/ath11k/ce.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 9324dcb45bbe..f0d0f4ecd4de 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 35cb7b58220e..4acacdf24e56 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
> index dc247b41390d..ea18c41cc451 100644
> --- a/drivers/net/wireless/ath/ath11k/debug.c
> +++ b/drivers/net/wireless/ath/ath11k/debug.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
> index fac6cb4aa597..4591a9e3a92e 100644
> --- a/drivers/net/wireless/ath/ath11k/debug.h
> +++ b/drivers/net/wireless/ath/ath11k/debug.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
> index 838c17f3dad2..27b301bc1a1b 100644
> --- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
> index f59e002e5dba..618f1946bf49 100644
> --- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> index 2ca3bc47e502..b392117eff3c 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index b55d9d023a55..aa2b28189cda 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
> index c968d5a6217e..4db71173db62 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index cc3bf25c9a91..faea5b12a2d6 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
> index 0a243ec5eb16..026820fda568 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.h
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index 69f78d209315..51a02b8e66cc 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
> index 0a1f151aad8a..f8a9f9c8e444 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.h
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index e0ec7c5f8112..b58ac11c2747 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
> index 8f1d2b359f50..5b13ccdf39e4 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.h
> +++ b/drivers/net/wireless/ath/ath11k/hal.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
> index dbfb82130db6..35e191b77271 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_desc.h
> +++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
> index f8abbb79261f..2de4b388db20 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
> index d854b47270c0..96555e4f4ef3 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_rx.h
> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
> index 2b1789a260d2..bb27591023fe 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.h b/drivers/net/wireless/ath/ath11k/hal_tx.h
> index 3b12dfda7423..f955070bcf1e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_tx.h
> +++ b/drivers/net/wireless/ath/ath11k/hal_tx.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
> index fd8444f845a5..9d4115f25ceb 100644
> --- a/drivers/net/wireless/ath/ath11k/htc.c
> +++ b/drivers/net/wireless/ath/ath11k/htc.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
> index 39fbee4861ab..f0a3387567ca 100644
> --- a/drivers/net/wireless/ath/ath11k/htc.h
> +++ b/drivers/net/wireless/ath/ath11k/htc.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
> index f510d9d9263c..dd39333ec0ea 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 25c9104afc96..2b4405728d2a 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
> index 29b42b145fc3..f84af1fc4952 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.h
> +++ b/drivers/net/wireless/ath/ath11k/mac.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
> index d484a3b42e49..4bf1dfa498b6 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.c
> +++ b/drivers/net/wireless/ath/ath11k/peer.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
> index 99e54f11cbc9..9a40d1f6ccd9 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.h
> +++ b/drivers/net/wireless/ath/ath11k/peer.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index fffc4c1dde19..adf41f28a231 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
> index f4d8ee8d59f7..df0685564e21 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.h
> +++ b/drivers/net/wireless/ath/ath11k/qmi.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
> index 4f9c808019e3..810050b033c4 100644
> --- a/drivers/net/wireless/ath/ath11k/reg.c
> +++ b/drivers/net/wireless/ath/ath11k/reg.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
> index d0fc246a34ce..39b7fc943541 100644
> --- a/drivers/net/wireless/ath/ath11k/reg.h
> +++ b/drivers/net/wireless/ath/ath11k/reg.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/rx_desc.h b/drivers/net/wireless/ath/ath11k/rx_desc.h
> index 9be97c4958e0..a5aff801f17f 100644
> --- a/drivers/net/wireless/ath/ath11k/rx_desc.h
> +++ b/drivers/net/wireless/ath/ath11k/rx_desc.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
> index 9274b6cc3921..932bee6d1740 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode.c
> +++ b/drivers/net/wireless/ath/ath11k/testmode.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/testmode.h b/drivers/net/wireless/ath/ath11k/testmode.h
> index 303091b7fe78..aaa122ed9069 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode.h
> +++ b/drivers/net/wireless/ath/ath11k/testmode.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/testmode_i.h b/drivers/net/wireless/ath/ath11k/testmode_i.h
> index 96ae22b558af..4bae2a9eeea4 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode_i.h
> +++ b/drivers/net/wireless/ath/ath11k/testmode_i.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/trace.c b/drivers/net/wireless/ath/ath11k/trace.c
> index df56457b7cbf..f0cc49ba0387 100644
> --- a/drivers/net/wireless/ath/ath11k/trace.c
> +++ b/drivers/net/wireless/ath/ath11k/trace.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
> index aa96c4e7a0d5..400f759568e1 100644
> --- a/drivers/net/wireless/ath/ath11k/trace.h
> +++ b/drivers/net/wireless/ath/ath11k/trace.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index e553adf1cf9d..3d1d4d3c3f20 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: ISC
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
> index 96be01972aef..28e16e353488 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: ISC */
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    */
>
>
> _______________________________________________
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
