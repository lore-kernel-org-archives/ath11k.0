Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkpyc-0002KD-Lm
 for ath11k@lists.infradead.org; Mon, 15 Jun 2020 14:20:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 7/8] ath11k: add ce services for IPQ6018
References: <1591678993-11016-1-git-send-email-akolli@codeaurora.org>
 <1591678993-11016-8-git-send-email-akolli@codeaurora.org>
 <CAGRGNgWO_KwfQcfh=DSB5NdM2696ZzVU7ZuQN_x_+op1c5ySEw@mail.gmail.com>
Date: Mon, 15 Jun 2020 17:20:28 +0300
In-Reply-To: <CAGRGNgWO_KwfQcfh=DSB5NdM2696ZzVU7ZuQN_x_+op1c5ySEw@mail.gmail.com>
 (Julian Calaby's message of "Tue, 9 Jun 2020 17:10:06 +1000")
Message-ID: <874krcjtqr.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Julian Calaby <julian.calaby@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Julian Calaby <julian.calaby@gmail.com> writes:

> On Tue, Jun 9, 2020 at 3:07 PM Anilkumar Kolli <akolli@codeaurora.org> wrote:
>>
>> IPQ6018 does not support mac2, add a new ce service map.
>>
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath11k/ahb.c | 122 ++++++++++++++++++++++++++++++++--
>>  1 file changed, 117 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
>> index b080ad8fab0a..25764f719db0 100644
>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>> @@ -647,8 +749,15 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
>>
>>         cfg->tgt_ce_len = ARRAY_SIZE(target_ce_config_wlan) - 1;
>>         cfg->tgt_ce = target_ce_config_wlan;
>> -       cfg->svc_to_ce_map_len = ARRAY_SIZE(target_service_to_ce_map_wlan);
>> -       cfg->svc_to_ce_map = target_service_to_ce_map_wlan;
>> +       if (ab->hw_params.dev_id == ATH11K_HW_IPQ6018) {
>> +               cfg->svc_to_ce_map_len =
>> +                       ARRAY_SIZE(target_service_to_ce_map_wlan_ipq6018);
>> +               cfg->svc_to_ce_map = target_service_to_ce_map_wlan_ipq6018;
>> +       } else {
>> +               cfg->svc_to_ce_map_len =
>> +                       ARRAY_SIZE(target_service_to_ce_map_wlan_ipq8074);
>> +               cfg->svc_to_ce_map = target_service_to_ce_map_wlan_ipq8074;
>> +       }
>
> You could just have a pointer to this array in the "hw_params"
> structure which would reduce this to something like:
>
> cfg->svc_to_ce_map_len = ARRAY_SIZE(ab->hw_params.service_to_ce_map);
> cfg->svc_to_ce_map = ab->hw_params.service_to_ce_map;
>
> and make adding future hardware easier.

Yeah, that's a good idea.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
