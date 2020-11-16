Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZYO-000406-H5
 for ath11k@lists.infradead.org; Mon, 16 Nov 2020 08:08:01 +0000
MIME-Version: 1.0
Date: Mon, 16 Nov 2020 13:37:57 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH v2 0/3] ath11k: vdev and peer delete synchronization with
 firmware
In-Reply-To: <1605166980-29115-1-git-send-email-mkenna@codeaurora.org>
References: <1605166980-29115-1-git-send-email-mkenna@codeaurora.org>
Message-ID: <07d18b4fbf313ab8524dc89e3a791629@codeaurora.org>
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
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org

On 2020-11-12 13:12, Maharaja Kennadyrajan wrote:

Hi Kalle,

Kindly ignore this patchset as I didn't mention the version number
in the subject name of the patches in the patchlist.
I will correct this and send v3 patchset.

Regret for the inconvenience caused.


Regards,
Maha


> When add an interface immediately after removing the interface,
> vdev deletion in firmware might not have been completed.
> add vdev_delete_resp_event and wait_event_timeout to synchronize
> with firmware.
> 
> Peer creation in firmware fails if last peer deletion is still in
> progress, add wait for the event after deleting every peer from host
> driver to synchronize with firmware.
> 
> 1) add vdev delete resp event and wait event to get ack from firmware
> 2) add wait event timeout for peer delete to get ack from firmware
> 3) code clean up and replace the api 
> 'ath11k_mac_get_ar_vdev_stop_status'
>    with 'ath11k_mac_get_ar_by_vdev_id'
> 
> V2: Rebased on latest ath.git TOT - Addressed Kalle's comment.
> 
> Ritesh Singh (3):
>   ath11k: vdev delete synchronization with firmware
>   ath11k: peer delete synchronization with firmware
>   ath11k: remove "ath11k_mac_get_ar_vdev_stop_status" references
> 
>  drivers/net/wireless/ath/ath11k/core.c |  2 +
>  drivers/net/wireless/ath/ath11k/core.h |  9 ++--
>  drivers/net/wireless/ath/ath11k/mac.c  | 82 
> ++++++++++++++++------------------
>  drivers/net/wireless/ath/ath11k/mac.h  |  2 -
>  drivers/net/wireless/ath/ath11k/peer.c | 44 ++++++++++++++++--
>  drivers/net/wireless/ath/ath11k/peer.h |  2 +
>  drivers/net/wireless/ath/ath11k/wmi.c  | 81 
> ++++++++++++++++++++++++++++++---
>  drivers/net/wireless/ath/ath11k/wmi.h  |  4 ++
>  8 files changed, 166 insertions(+), 60 deletions(-)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
