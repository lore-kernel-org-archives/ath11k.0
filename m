Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDt1-0006jE-2x
 for ath11k@lists.infradead.org; Mon, 07 Sep 2020 09:56:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3 2/3] ath11k: copy ce service configs to hw_params
References: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
 <1592458104-2961-3-git-send-email-akolli@codeaurora.org>
 <CAGRGNgV74fCD1gb=rXEe1BMN5+5stYeX3W6eKc4-do76TBmFqA@mail.gmail.com>
 <34ed705f28b40fab493b8c888138e6a7@codeaurora.org>
Date: Mon, 7 Sep 2020 09:56:26 +0000
In-Reply-To: <34ed705f28b40fab493b8c888138e6a7@codeaurora.org>
 (akolli@codeaurora.org's message of "Fri, 19 Jun 2020 21:54:42 +0530")
Message-ID: <0101017467fecfa9-377850da-b796-4ec1-a3fc-e5c6ad798692-000000@us-west-2.amazonses.com>
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
To: akolli@codeaurora.org
Cc: Julian Calaby <julian.calaby@gmail.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, devicetree <devicetree@vger.kernel.org>

akolli@codeaurora.org writes:

> On 2020-06-19 04:40, Julian Calaby wrote:
>>
>> On Thu, Jun 18, 2020 at 3:31 PM Anilkumar Kolli
>> <akolli@codeaurora.org> wrote:
>>>
>>> @@ -950,6 +950,16 @@ static int ath11k_ahb_probe(struct
>>> platform_device *pdev)
>>>                 goto err_hal_srng_deinit;
>>>         }
>>>
>>> +       ret = ath11k_init_hw_params(ab);
>>> +       if (ret) {
>>> +               ath11k_err(ab, "failed to get hw params %d\n", ret);
>>> +               return ret;
>>> +       }
>>> +
>>> +       ab->hw_params.svc_to_ce_map_len =
>>> +
>>> ARRAY_SIZE(target_service_to_ce_map_wlan_ipq8074);
>>> +       ab->hw_params.svc_to_ce_map =
>>> target_service_to_ce_map_wlan_ipq8074;
>>
>> I think you misunderstood my point about this, the point wasn't to
>> copy the svc map to hw_params, but define it in hw_params:
>>
>> +       {
>> +               .hw_rev = ATH11K_HW_IPQ6018,
>> +               .name = "ipq6018 hw1.0",
>> +               .fw = {
>> +                       .dir = "IPQ6018/hw1.0",
>> +                       .board_size = 256 * 1024,
>> +                       .cal_size = 256 * 1024,
>> +               },
>> +               .max_radios = 2,
>> +               .bdf_addr = 0x4ABC0000,
>> +               .hw_ops = &ipq6018_ops,
>> +               .svc_to_ce_map_len =
>> ARRAY_SIZE(target_service_to_ce_map_wlan_ipq6018,
>> +               .svc_to_ce_map = target_service_to_ce_map_wlan_ipq6018,
>> +       },
>>
>> That completely eliminates special case code based on the hardware ID
>> in the driver.
>>
> The static array of structures target_service_to_ce_map_wlan_ipq6018[]
> is defined in ahb.c and hw_params are initialised in core.c, this will
> not work. no?

You could move the map arrays to hw.c, as an example see how
ath11k_hw_ring_mask_ipq8074 is implemented. That way we don't need any
new hw_rev checks.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
