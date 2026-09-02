Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D07C61DFD
	for <ath11k@archiver.kernel.org>; Wed,  2 Sep 2026 05:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EErxRj9UamHxjL4qovNFexC2eoDhDkme3XwtJu95u6Y=; b=O1clC23MXcTy6PQuMq4rctkDLN
	7af1dGs+OFe5m24k1k+2C2gx8STJ6xGMKoYMy8cP17VRhOAARpxt/DpHBk39FSRA+OPB3kBYTd9bb
	oOgk9aK43R2oqlryQ8T5FuqlX9Ovf4qGtRgEJz4a/cWizvp5yE2p0DdkPZEgXyNgZcLAeW+tDS8a2
	FEi/F9KTAvRPMiNhvP69Zv4tC13Uqphb9PB14VAlrJWVlYZQxYHx2BnU+ImXLhasmZE9r0uWymQbu
	2LlXq6qKPTpBcLobX3LPBNizVoxh5dJ71bGrFvmUZJsYyaOSVk7dDfnWdMc2QGDqblsGXmyvCDiGs
	dMNx0yjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1dYt-0000000Do1h-1V3E;
	Wed, 02 Sep 2026 05:31:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1dYq-0000000Do1I-2atf
	for ath11k@lists.infradead.org;
	Wed, 02 Sep 2026 05:31:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6824xW6g3664083
	for <ath11k@lists.infradead.org>; Wed, 2 Sep 2026 05:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EErxRj9UamHxjL4qovNFexC2eoDhDkme3XwtJu95u6Y=; b=c2jPeDiTCeOUZ+Ms
	LDfvknHx3w8HS4tzLQFo8FeefuE26hYIfDzmCR63ke5HsTrJhVNRJ4izfpXB0ssw
	webIHA/6bABWsLA1p/ztDuFgHvg1mkJXMCDTkhmkQP3IGyj7VCPugPCCD+1Oq7Oe
	GKwl73PE7usS1R0M0BFMgfEmqQwzWrKy2dI0rZbPKedLcZDptd4JdDT+Ap5zr7or
	Xcj9TYijr4hxx1KlLlOSR1iT/240UHSABpzX0lHN4vfOpdyXfvXJSNYZVlnVAgcA
	OQaL+qvn/miYq+lTGRaGVsYnHHepG14/UNsfuRW4Uht9HuVYjLcLQQFZ8OMwvjOS
	GVLutA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j28x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 02 Sep 2026 05:31:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso1491707a12.3
        for <ath11k@lists.infradead.org>; Tue, 01 Sep 2026 22:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788327059; x=1788931859; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EErxRj9UamHxjL4qovNFexC2eoDhDkme3XwtJu95u6Y=;
        b=b42wCFmzq7AHG+79Njp5/cfL9HKBh/66nYsXeydoztVpRjwgWTr2cbTv271buyanzK
         3QnxDgYlC2E6oKtHyYDne1ukTyKZZ30v/TsLyuhAC1VQ7ipqOTI2G0fnHAlSEJ8yqyOX
         MftVFNnfNqzFtxf9h6gT13raamGTtNahewX2J/bwI9u/n2FtH2A3bh4j3ElKdaSWFN0W
         W4x7JK8u+o4OIkD8wMbed4htPJ5ZS1nBMTajCIOZSIg46ldvViX0WfI+TD4dBI4/C2Ov
         hZSxngAkehdHjNk2K9PKeetvBJbAgIgXjHPfszUWIwd2Q9N0KrcSBY/XvlhK/DxcDjCY
         dtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788327059; x=1788931859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EErxRj9UamHxjL4qovNFexC2eoDhDkme3XwtJu95u6Y=;
        b=BWBjRFHhTmhWuQgUQPaLOwbHSqjV3cUfqq1XM0+qsqLcFKuQswbx2sApfOz483s5/Q
         lK2OIJeklk5c6Vw6DDlh38QN8aBmBRiSgmSxj1mfsk3vkMFjF8k0qRVa+LF25RISuyQV
         v4DLclgOtfd/u8PyLtsr/lhcd8fLlgIPWhCyBM0UY5CyQ3gRVTBVGkd2ZADy+H9oUq/6
         PunmS+AeSFeQPGJRjvT1QWt78OXrjBIkLmzun2Zn8/d53EOsKCh0YAlDgn3CRC+9A/sZ
         gr6CQLIVeWelx+tJAWh0ycPDUFkz/Y5MReB/v0L3j2qPuj+xYS5kXfbfinD8QKfuzfji
         412A==
X-Forwarded-Encrypted: i=1; AKwUvBwKrjpyKDJALBXT6ITuMfWb1bBaeYTmkG/nyrTdDvSUsyMtNBbMnyJipqyQTXEoLRSKMp6Yomg=@lists.infradead.org
X-Gm-Message-State: AFuF++nW0XwtVx0L1wORp77nkZI0dP5RWkWBK/t+DimXehLLQ2iEwavE
	R+d+vmrIpAH/zc2ylvEyaTMQXw0+kSPpF6eACmgHS3RzY2CDTjFntSI/Zzs0xowPyzva6Yuu0gO
	oWcXkLfGhJpQfd/28MHrnnTLjYLsAe1XBD7nFSqi7nUasjb8KaYdhkZt8k2rD9rSS
X-Gm-Gg: AYBFou0Z2J0wy+UJfNZGoBSNKlyNABmPZysoAw7iQ547CeipZwT0WWms//Y+8h/VcIB
	AgzlgTAi7+gRELR5nGltwNDBf8KdqEQQBQwu3BMRLocKe+LktUMWd8SP5Q0B0zQckFfX+XThXId
	CHNcpa8cVe68pstkwXhqg6pvq1rQjaFx7nibgwWA1AypwwSytNhzw4k88iKpGhu7DoSJeF3z9KQ
	VpjnbsMe/1ZANMZI0D3VYlU2g/dKIVc+I75VQ90ceuPuUl2CV70DN1KR5o3bT4G8WF8DA1a7tB+
	1kE2fwTVfUDjwXg+sj3ErvymtDfsZbwWQIQqc5Nitkfg4HyhyiMqQ/2rlYFTq2W/lD95Rl+vn2f
	LnjH6mNYaVDu24Vmca2Zwb1umVW0bV4/d
X-Received: by 2002:a17:90b:1c07:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39aee260bc0mr2726750a91.23.1788327059379;
        Tue, 01 Sep 2026 22:30:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1c07:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39aee260bc0mr2726667a91.23.1788327058905;
        Tue, 01 Sep 2026 22:30:58 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e8c6fcbsm5163942c88.0.2026.09.01.22.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:30:58 -0700 (PDT)
Message-ID: <774adaa9-55de-4456-9ee2-eb3c5d7ea0a5@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:00:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] wifi: ath11k: Add support for MHI bandwidth
 scaling
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, Miaoqing Pan <quic_miaoqing@quicinc.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
 <5b10cb13-77e6-4754-a885-92c873866ef4@linaro.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <5b10cb13-77e6-4754-a885-92c873866ef4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4h_JU2dLv0FEmjKyZ2YtPfueBsSJfBka
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0NiBTYWx0ZWRfXyHz+qiz+9Nxj
 VJSMpv4uqnFrkxINJw/MSR+2TcyoVMI/Nn/Ji0c7+Ky9z74sgxd2Gg2dbOMBawh3MX0/ig+Enpo
 mYLNpOJHGxCMkWTig8SZc2VrAnmGIf4=
X-Proofpoint-ORIG-GUID: 4h_JU2dLv0FEmjKyZ2YtPfueBsSJfBka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0NiBTYWx0ZWRfX+CqflePaEgHK
 C+POGfK122IgBcGE6B0wk/0OjkZ0mQDMooidKzNcsI17yzTcXrk7YaSsxT/tD8gJUab+PgwUkw7
 tw/zJ4wBKGG15atIY8SL5fs2cJ340oTgMBosQmcHjClFZPPfCEf+A27YUW724j5A/UwThCT1dDj
 OM7s6g7pHCA/Q2xPVaA7vDxWn0kSC+6r1iNU/MdhVrKMPcztTY7rZ+nd8r+zX0JDEDsjrGXqEze
 87klttzgkBB/pIRA50vaTckpvM1sUQev4l/IjZ1mGz7WIE7bzrECJSvqmeZwdDoKfry+sztG0s5
 8vAWFzohOnFhg5jO95d3368Gxb7hASfvAacZbaCTYhR67Zt53IsNkeoB8gt542cQeO52Noqp/u9
 lbmqBfe53SkL4Gzj4R/mBoEGZ6wU2M4aMxn8WC4UKp7YSdwzWXt1D374Axw98aeYaZI6dNL2HF4
 cRpGoTZdqzHz2WwVLqA==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a97b494 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WikkZxfSKXF9q-dYMVUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_223100_681635_123B7E43 
X-CRM114-Status: GOOD (  24.29  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 9/1/2026 8:15 PM, Neil Armstrong wrote:
> Hi,
>
> On 8/19/26 15:25, Krishna Chaitanya Chundru wrote:
>> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
>>
>> Add support for MHI bandwidth scaling, which will reduce power consumption
>> if WLAN operates with lower bandwidth. This feature is only enabled for
>> QCA6390.
>>
>> Bandwidth scaling is initiated by the endpoint firmware based upon the
>> bandwidth requirements, if there is high bandwidth data endpoint requests
>> for higher data rates or if there is less bandwidth they request for lower
>> data rates to reduce power. Endpoint initiates this through MHI protocol.
>>
>> Tested-on: WCN6855 hw2.1 PCI
>> WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>
> Somehow unrelated, but I added this to the ath12k to test on an WCN785x and
> I just
> got a single event to set the speed to 5GT/s and no further event whatever
> the state
> of the Wireless link is.
>
> Is there anything required on the ath12k side to allow lowering the speed to
> 2.5GT/s ? 
some wifi device has some limitation due to that they will stay in gen2 only.

- Krishna Chaitanya.
>
> Thanks,
> Neil
>
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/mhi.c | 38
>> +++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c
>> b/drivers/net/wireless/ath/ath11k/mhi.c
>> index a6c9ff112c68..9bff4c4bca3b 100644
>> --- a/drivers/net/wireless/ath/ath11k/mhi.c
>> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
>> @@ -20,6 +20,7 @@
>>   #define MHI_TIMEOUT_DEFAULT_MS    20000
>>   #define RDDM_DUMP_SIZE    0x420000
>>   #define MHI_CB_INVALID    0xff
>> +#define MHI_BW_SCALE_CHAN_DB 126
>>     static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
>>       {
>> @@ -71,6 +72,17 @@ static struct mhi_event_config
>> ath11k_mhi_events_qca6390[] = {
>>           .client_managed = false,
>>           .offload_channel = false,
>>       },
>> +    {
>> +        .num_elements = 8,
>> +        .irq_moderation_ms = 0,
>> +        .irq = 1,
>> +        .mode = MHI_DB_BRST_DISABLE,
>> +        .data_type = MHI_ER_BW_SCALE,
>> +        .priority = 2,
>> +        .hardware_event = false,
>> +        .client_managed = false,
>> +        .offload_channel = false,
>> +    },
>>   };
>>     static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
>> @@ -311,6 +323,30 @@ static void ath11k_mhi_op_write_reg(struct
>> mhi_controller *mhi_cntrl,
>>       writel(val, addr);
>>   }
>>   +static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller
>> *mhi_cntrl,
>> +                       enum mhi_er_data_type type)
>> +{
>> +    if (type == MHI_ER_BW_SCALE)
>> +        return MHI_BW_SCALE_CHAN_DB;
>> +
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
>> +                  struct mhi_link_info *link_info)
>> +{
>> +    enum pci_bus_speed speed =
>> pci_lnkctl2_bus_speed(link_info->target_link_speed);
>> +    struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
>> +    struct pci_dev *pci_dev = to_pci_dev(ab->dev);
>> +    struct pci_dev *pdev;
>> +
>> +    pdev = pci_upstream_bridge(pci_dev);
>> +    if (!pdev)
>> +        return -ENODEV;
>> +
>> +    return pcie_set_target_speed(pdev, speed, true);
>> +}
>> +
>>   static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
>>   {
>>       struct device_node *np;
>> @@ -387,6 +423,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>>       mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
>>       mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
>>       mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
>> +    mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
>> +    mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
>>         switch (ab->hw_rev) {
>>       case ATH11K_HW_QCN9074_HW10:
>>
>


