Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jidBU-0008Vx-85
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 12:16:55 +0000
MIME-Version: 1.0
Date: Tue, 09 Jun 2020 17:46:37 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH 3/3] ath11k: remove "ath11k_mac_get_ar_vdev_stop_status"
 references
In-Reply-To: <87tuzkmosd.fsf@codeaurora.org>
References: <1590067829-26109-4-git-send-email-mkenna@codeaurora.org>
 <20200528073034.F14B9C43387@smtp.codeaurora.org>
 <80107de209f1149ecae07a50a7cf86a9@codeaurora.org>
 <87tuzkmosd.fsf@codeaurora.org>
Message-ID: <0fdcc91bc6e9ffd7d924e306895cf903@codeaurora.org>
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
Cc: Ritesh Singh <ritesi@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-09 17:31, Kalle Valo wrote:
> Maharaja Kennadyrajan <mkenna@codeaurora.org> writes:
> 
>> On 2020-05-28 13:00, Kalle Valo wrote:
>>> Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:
>>> 
>>>> Unused structure ath11k_vdev_stop_status is removed.
>>>> 'ath11k_mac_get_ar_vdev_stop_status' api has been replaced
>>>> with 'ath11k_mac_get_ar_by_vdev_id' inside vdev_stopped_event.
>>>> 
>>>> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
>>>> 
>>>> Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
>>>> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
>>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>>> 
>>> What about other firmware branches? For example, will this break
>>> 2.1.0.1 branch support?
>> 
>> [Maha]: It won't break 2.1.0.1 branch as it is host related change.
> 
> What do you mean with "host related changed" exactly? In patch 1 I see
> that you add a new handler for WMI_VDEV_DELETE_RESP_EVENTID event. So
> firmware functionality is very much involved here, right? For example,
> do all branches send that event to the host?

[Maha]: You are right, Stop event will come for all the firmware.
So, it won't break with other firmware branches.
we just replaced the ath11k_mac_get_ar_vdev_stop_status by 
ath11k_mac_get_ar_by_vdev_id.

Regards,
Maha

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
