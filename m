Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmJp2-00023z-F9
 for ath11k@lists.infradead.org; Fri, 19 Jun 2020 16:24:58 +0000
MIME-Version: 1.0
Date: Fri, 19 Jun 2020 21:54:42 +0530
From: akolli@codeaurora.org
Subject: Re: [PATCH v3 2/3] ath11k: copy ce service configs to hw_params
In-Reply-To: <CAGRGNgV74fCD1gb=rXEe1BMN5+5stYeX3W6eKc4-do76TBmFqA@mail.gmail.com>
References: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
 <1592458104-2961-3-git-send-email-akolli@codeaurora.org>
 <CAGRGNgV74fCD1gb=rXEe1BMN5+5stYeX3W6eKc4-do76TBmFqA@mail.gmail.com>
Message-ID: <34ed705f28b40fab493b8c888138e6a7@codeaurora.org>
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
To: Julian Calaby <julian.calaby@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-19 04:40, Julian Calaby wrote:
> Hi Anilkumar,
> 
> On Thu, Jun 18, 2020 at 3:31 PM Anilkumar Kolli <akolli@codeaurora.org> 
> wrote:
>> 
>> No functional changes, added target ce service configurations
>> to hw_params.
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> ---
>> V3:
>>  - added ce svc configs in hw_params
>> 
>>  drivers/net/wireless/ath/ath11k/ahb.c  | 20 +++++++++++++++-----
>>  drivers/net/wireless/ath/ath11k/core.c |  8 +-------
>>  drivers/net/wireless/ath/ath11k/core.h |  1 +
>>  drivers/net/wireless/ath/ath11k/hw.h   |  2 ++
>>  4 files changed, 19 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c 
>> b/drivers/net/wireless/ath/ath11k/ahb.c
>> index 7e9bfeaaf4d2..aa74d27e5871 100644
>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>> @@ -152,7 +152,7 @@ static const struct ce_pipe_config 
>> target_ce_config_wlan[] = {
>>   * This table is derived from the CE_PCI TABLE, above.
>>   * It is passed to the Target at startup for use by firmware.
>>   */
>> -static const struct service_to_pipe target_service_to_ce_map_wlan[] = 
>> {
>> +static const struct service_to_pipe 
>> target_service_to_ce_map_wlan_ipq8074[] = {
>>         {
>>                 .service_id = 
>> __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
>>                 .pipedir = __cpu_to_le32(PIPEDIR_OUT),  /* out = UL = 
>> host -> target */
>> @@ -644,8 +644,8 @@ static void ath11k_ahb_init_qmi_ce_config(struct 
>> ath11k_base *ab)
>> 
>>         cfg->tgt_ce_len = ARRAY_SIZE(target_ce_config_wlan) - 1;
>>         cfg->tgt_ce = target_ce_config_wlan;
>> -       cfg->svc_to_ce_map_len = 
>> ARRAY_SIZE(target_service_to_ce_map_wlan);
>> -       cfg->svc_to_ce_map = target_service_to_ce_map_wlan;
>> +       cfg->svc_to_ce_map_len = ab->hw_params.svc_to_ce_map_len;
>> +       cfg->svc_to_ce_map = ab->hw_params.svc_to_ce_map;
>>  }
>> 
>>  static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
>> @@ -853,8 +853,8 @@ static int ath11k_ahb_map_service_to_pipe(struct 
>> ath11k_base *ab, u16 service_id
>>         bool ul_set = false, dl_set = false;
>>         int i;
>> 
>> -       for (i = 0; i < ARRAY_SIZE(target_service_to_ce_map_wlan); 
>> i++) {
>> -               entry = &target_service_to_ce_map_wlan[i];
>> +       for (i = 0; i < ab->hw_params.svc_to_ce_map_len; i++) {
>> +               entry = &ab->hw_params.svc_to_ce_map[i];
>> 
>>                 if (__le32_to_cpu(entry->service_id) != service_id)
>>                         continue;
>> @@ -950,6 +950,16 @@ static int ath11k_ahb_probe(struct 
>> platform_device *pdev)
>>                 goto err_hal_srng_deinit;
>>         }
>> 
>> +       ret = ath11k_init_hw_params(ab);
>> +       if (ret) {
>> +               ath11k_err(ab, "failed to get hw params %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       ab->hw_params.svc_to_ce_map_len =
>> +                       
>> ARRAY_SIZE(target_service_to_ce_map_wlan_ipq8074);
>> +       ab->hw_params.svc_to_ce_map = 
>> target_service_to_ce_map_wlan_ipq8074;
> 
> I think you misunderstood my point about this, the point wasn't to
> copy the svc map to hw_params, but define it in hw_params:
> 
> +       {
> +               .hw_rev = ATH11K_HW_IPQ6018,
> +               .name = "ipq6018 hw1.0",
> +               .fw = {
> +                       .dir = "IPQ6018/hw1.0",
> +                       .board_size = 256 * 1024,
> +                       .cal_size = 256 * 1024,
> +               },
> +               .max_radios = 2,
> +               .bdf_addr = 0x4ABC0000,
> +               .hw_ops = &ipq6018_ops,
> +               .svc_to_ce_map_len =
> ARRAY_SIZE(target_service_to_ce_map_wlan_ipq6018,
> +               .svc_to_ce_map = target_service_to_ce_map_wlan_ipq6018,
> +       },
> 
> That completely eliminates special case code based on the hardware ID
> in the driver.
> 
The static array of structures target_service_to_ce_map_wlan_ipq6018[] 
is defined in ahb.c and hw_params are initialised in core.c, this will 
not work. no?

Thanks
Anil

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
