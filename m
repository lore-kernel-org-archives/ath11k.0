Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifmwZ-0001Aa-Bj
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 15:33:28 +0000
Subject: Re: [PATCH V3 0/9] ath11k: resend pending patches
References: <20191213083734.22471-1-john@phrozen.org>
From: John Crispin <john@phrozen.org>
Message-ID: <28044b5a-2bac-a3af-c2ee-e6ec81373e4c@phrozen.org>
Date: Fri, 13 Dec 2019 16:33:22 +0100
MIME-Version: 1.0
In-Reply-To: <20191213083734.22471-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

On 13/12/2019 09:37, John Crispin wrote:
> Kalle merged ath11k into his next tree and then applied the huge backlog
> from patchwork. This is a resend of pending patches that no longer apply
> due to merge order conflicts.
> 

sorry, forgot to Cc: linux-wireless

> John Crispin (9):
>    ath11k: add wmi helper for turning STA PS on/off
>    ath11k: disable PS for STA interfaces by default upon bringup
>    ath11k: drop memset when setting up a tx cmd desc
>    ath11k: rename ath11k_wmi_base instances from wmi_sc to wmi_ab
>    ath11k: add WMI calls to manually add/del/pause/resume TWT dialogs
>    ath11k: add debugfs for TWT debug calls
>    ath11k: move some tx_status parsing to debugfs code
>    ath11k: optimise ath11k_dp_tx_completion_handler
>    ath11k: optimize ath11k_hal_tx_status_parse
> 
>   drivers/net/wireless/ath/ath11k/core.c        |   4 +-
>   drivers/net/wireless/ath/ath11k/core.h        |   3 +-
>   drivers/net/wireless/ath/ath11k/debug.c       | 198 +++++++++
>   drivers/net/wireless/ath/ath11k/debug.h       |   8 +
>   drivers/net/wireless/ath/ath11k/debugfs_sta.c |  66 +--
>   drivers/net/wireless/ath/ath11k/dp.c          |  16 +-
>   drivers/net/wireless/ath/ath11k/dp.h          |  11 +-
>   drivers/net/wireless/ath/ath11k/dp_tx.c       |  81 ++--
>   drivers/net/wireless/ath/ath11k/hal_tx.c      |  74 +---
>   drivers/net/wireless/ath/ath11k/hal_tx.h      |  13 +-
>   drivers/net/wireless/ath/ath11k/htc.c         |   2 +-
>   drivers/net/wireless/ath/ath11k/mac.c         |  15 +-
>   drivers/net/wireless/ath/ath11k/testmode.c    |   2 +-
>   drivers/net/wireless/ath/ath11k/wmi.c         | 408 ++++++++++++++----
>   drivers/net/wireless/ath/ath11k/wmi.h         | 123 +++++-
>   15 files changed, 773 insertions(+), 251 deletions(-)
> 


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
