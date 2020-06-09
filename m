Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiYOu-0001rq-AD
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 07:10:25 +0000
Received: by mail-lj1-x242.google.com with SMTP id 9so23669095ljc.8
 for <ath11k@lists.infradead.org>; Tue, 09 Jun 2020 00:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <1591678993-11016-1-git-send-email-akolli@codeaurora.org>
 <1591678993-11016-8-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1591678993-11016-8-git-send-email-akolli@codeaurora.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 9 Jun 2020 17:10:06 +1000
Message-ID: <CAGRGNgWO_KwfQcfh=DSB5NdM2696ZzVU7ZuQN_x_+op1c5ySEw@mail.gmail.com>
Subject: Re: [PATCH 7/8] ath11k: add ce services for IPQ6018
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Hi Anilkumar,

On Tue, Jun 9, 2020 at 3:07 PM Anilkumar Kolli <akolli@codeaurora.org> wrote:
>
> IPQ6018 does not support mac2, add a new ce service map.
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 122 ++++++++++++++++++++++++++++++++--
>  1 file changed, 117 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index b080ad8fab0a..25764f719db0 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -647,8 +749,15 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
>
>         cfg->tgt_ce_len = ARRAY_SIZE(target_ce_config_wlan) - 1;
>         cfg->tgt_ce = target_ce_config_wlan;
> -       cfg->svc_to_ce_map_len = ARRAY_SIZE(target_service_to_ce_map_wlan);
> -       cfg->svc_to_ce_map = target_service_to_ce_map_wlan;
> +       if (ab->hw_params.dev_id == ATH11K_HW_IPQ6018) {
> +               cfg->svc_to_ce_map_len =
> +                       ARRAY_SIZE(target_service_to_ce_map_wlan_ipq6018);
> +               cfg->svc_to_ce_map = target_service_to_ce_map_wlan_ipq6018;
> +       } else {
> +               cfg->svc_to_ce_map_len =
> +                       ARRAY_SIZE(target_service_to_ce_map_wlan_ipq8074);
> +               cfg->svc_to_ce_map = target_service_to_ce_map_wlan_ipq8074;
> +       }

You could just have a pointer to this array in the "hw_params"
structure which would reduce this to something like:

cfg->svc_to_ce_map_len = ARRAY_SIZE(ab->hw_params.service_to_ce_map);
cfg->svc_to_ce_map = ab->hw_params.service_to_ce_map;

and make adding future hardware easier.

>  }
>
>  static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
> @@ -856,8 +965,11 @@ static int ath11k_ahb_map_service_to_pipe(struct ath11k_base *ab, u16 service_id
>         bool ul_set = false, dl_set = false;
>         int i;
>
> -       for (i = 0; i < ARRAY_SIZE(target_service_to_ce_map_wlan); i++) {
> -               entry = &target_service_to_ce_map_wlan[i];
> +       for (i = 0; i < ab->qmi.ce_cfg.svc_to_ce_map_len; i++) {

Is this the same "svc_to_ce_map_len" as in the hunk above?

If so the code below could just be:

entry = &ab->qmi.ce_cfg.svc_to_ce_map[i];

> +               if (ab->hw_params.dev_id == ATH11K_HW_IPQ6018)
> +                       entry = &target_service_to_ce_map_wlan_ipq6018[i];
> +               else
> +                       entry = &target_service_to_ce_map_wlan_ipq8074[i];
>
>                 if (__le32_to_cpu(entry->service_id) != service_id)
>                         continue;
> --
> 2.7.4
>

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
