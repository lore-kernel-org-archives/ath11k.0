Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A549CF45C5
	for <ath11k@archiver.kernel.org>; Mon, 12 Jan 2026 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyrQeNRGMKiWJm9jy2A0UK3uV8Lg7oA7wv2Q1YlslQE=; b=xDdjNv+b1AD3nEACwF5EZZ/c0X
	P7QpQSJS8tjOmrMiC9OF3ajVMEI6hdhZ1Aeyra09wodBDbMzXomnTR3g1/gsWfUVVISnqGicWgdJO
	PvaowYWHgwm2jL+0S6/+/2covw7EtPJ5bP7Z8QZV8DXsx1edd1D1bxtODuvuIPv/GunKLG+bUsA0K
	4D8utFEIKhWvNw/a21Fx+/x8WO+LfGycuBNVjoLbslBxtSccUsMOpl7G+9/fZPMGbywPvqgmziUwd
	uzmQKoqhboPxEK9Wv3D73QrlwRhjq/wwLOnVrml00RB15D3A55qfXattDCD7n3NxnpU2V8LhJfb0Z
	EAoqB1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNwi-0000000669I-01l0;
	Mon, 12 Jan 2026 19:51:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNwf-0000000668W-0xgc
	for ath11k@lists.infradead.org;
	Mon, 12 Jan 2026 19:51:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CHvirw2224775
	for <ath11k@lists.infradead.org>; Mon, 12 Jan 2026 19:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyrQeNRGMKiWJm9jy2A0UK3uV8Lg7oA7wv2Q1YlslQE=; b=ZA9Je4oqZW40L1hB
	+78wHZw/b74HNB62MD4k0vJK0pyTwjMEDTuW2gjj3VM48Zjl6lRGWTwD6ngd9ksl
	PilZmg5s+d0GXyNkFfZ3t+5tFkmxki5jQRyZnvm01lcc3cg5RvrUUGQQvxs6XPuX
	tJDbn1ieTXQbgQvuzBifG2/KsURVdkjJ3z3EsDrLtIGjBijY+6d4wZ8Hcjn/axTP
	VyEovzbyIQkIeln0IYtKshzMmIIfjq/YJHivJ/dN8iavUc4+e/uZ15iHmrFXwltT
	Vsx41pi7wHh8gZw9ZkZJu08iGBmGT5G8zE6zsDldc6svK8L+TfS9uTLm4gVLdkPm
	lIOUMw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn5tjrau0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 12 Jan 2026 19:51:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae25c02e7bso23199790eec.0
        for <ath11k@lists.infradead.org>; Mon, 12 Jan 2026 11:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768247479; x=1768852279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AyrQeNRGMKiWJm9jy2A0UK3uV8Lg7oA7wv2Q1YlslQE=;
        b=SeBFJrVuR5ErJUVZ8mcV+F0jmcwOr7xu31a9pSx+KlHKN45J2DOPg0nZOcvwpLTP+r
         +r0NIj9qtNcmEJC1m5xwSoRRDWljcAVmTekRZ5+qo0BXF512pymnezGTPIkr9E47iyjs
         s6AiCmE2U9W2A8FHFJku61GdrgLP99QVv8ZeDrDWyY656MX6MwOTXSdM7YSbv2bIwLfp
         mnLgy1Grtsuqx9Hco93vCZoyEqjOehIkSkHVk0khvClZjUNRIyhaznhmN/JU9aemc99G
         LrfwNuDdGwon4Xi4ad+dZWOCfeDpDMs6e7Qp7c3Hnodk1/3FFNHOb1bqXyZEP93syi1Y
         q00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768247479; x=1768852279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyrQeNRGMKiWJm9jy2A0UK3uV8Lg7oA7wv2Q1YlslQE=;
        b=NjeyfegO45E1a/joRQFTD2dclKg1acowA/mU3MOWtBRMXS8g3llp6MClTTtx2tZ0Cf
         FGwGK39ziT/+b0QO6sHsgYBepMwDl/gnoh67dVIFWE3mggunLBKYXzqXpy08xQzd67d/
         tiYMhf5chqx0yU8bcYk6Q0sQesyxRRcC4pcHRffnLl07cCRQVNhOj1ugtiYDjEujKv+v
         ZdU1z3cFxyxgvKedCLVidRH+SlsRCuESktm8ktRKLAonBN3fLrc1GWIpcBi9rUxkXcZX
         yYUbd5CZAKmuqiehnwzqWutJddBMeHa+IbFiK+BCf/O1Emor3Y4sDHgPPWjr4/AZflVC
         hJcQ==
X-Gm-Message-State: AOJu0YyJ3hYRnOUQqT/IuzZJzXhV6D+X7x0UkrC1Nk1fZw+e9y/YxZHL
	Fy1HTCT+VFTk3vHJstbulnN6xhXpP2wzuTakVrT059lgFpGaCt4lRCIOWYQtLl9p8VObsiEa4TT
	ysqwTH+dzPOsK56MknwRfOLSpfg0UjVFuA50f9n10EUJFHk6J484LH0b6b80tQVRa
X-Gm-Gg: AY/fxX6bvQfhSHtGSNernns1pJLWGyaT7e9wkU+12bsinFts1a+3GY8RcjXJpI3dvPg
	AAMuXBub/YPgLZd6m1WQUD4Ha5dnJdN6J73O9GlT4cnmLntrWMYwl471WsmOy4Oq9Oj/xeVAcCm
	Pl8HytuhlakoWiyql0IweTQyZWcqTNiC4NBJZIL6FWUxQbbmM86lag/E+zU4/G91dzDPWIezUmH
	T6ZpHlcPCBwW7oCvqLLyv/qOJ0vfVU3ojqaziZJm8pI78pkUiqnDokITHngrfZeAtnF3fXC19IY
	BB/vMuVuwVd02cEDWjHRZVCNCBgrnZvzFbQDdoiQnB31gynC7oOKlnbuqt5X6z6ew+vevnLnbs4
	T3Fer3lyUtZiJYz4KVrnBcnMR9CrWiDujmZCfOQQ6f/vY/p5zLXNkGBndnuEb9Durpoj+RArQKy
	F5
X-Received: by 2002:a05:7301:490b:b0:2ab:9f55:d15a with SMTP id 5a478bee46e88-2b17d318ccemr12574113eec.29.1768247479045;
        Mon, 12 Jan 2026 11:51:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHk6xYB4ZRN+cIwyeLW8/iG9JuwoV/B2OUgags4UdIMA807zGQKH2Qblcn9/Gn+mcQnl8ucdA==
X-Received: by 2002:a05:7301:490b:b0:2ab:9f55:d15a with SMTP id 5a478bee46e88-2b17d318ccemr12574098eec.29.1768247478533;
        Mon, 12 Jan 2026 11:51:18 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm15520905eec.33.2026.01.12.11.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 11:51:18 -0800 (PST)
Message-ID: <0ad4722d-1557-4d8d-ae45-c0fdf893067f@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:51:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 2/2] dt-bindings: net: wireless: ath11k-pci:
 deprecate 'firmware-name' property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
 <20251204071100.970518-3-miaoqing.pan@oss.qualcomm.com>
 <f60bc80d-a947-4083-9e14-000a937de412@oss.qualcomm.com>
 <76d1c3ad-d648-4719-b016-1f16b195e64c@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <76d1c3ad-d648-4719-b016-1f16b195e64c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfcFJbrl c=1 sm=1 tr=0 ts=696550b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=V5SxF7jbE5cyk4fQ5xYA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE2NSBTYWx0ZWRfXxIZpeAw65Rz8
 hCLLKfquERc2Fg79AVez1B5g/83pLHbVtpfeVi46Ez63WoWGERA5XyUkUIucQWeqBDZdqIdEHVq
 UynLgtnKXfPF2zu66rNsFl/bplMQNUYivnPImjqHN8YtFzp8uJ8hp+XZXk3tkv4lqjjYgtkEqAD
 4+SjJlBBU3KQsx5T14kkhgIDSKKStonQzW/o1KrHrmTTl8afD7ad/7mBMNV/QzKl/Uyt5/k9eJu
 ryVIPiST5z28IKxquormDPvn5OlQk5bnz6A28Md0CfJGapAuC2DrP4P5XN1LrXZQzQBvTO3H1jI
 TxDCJd3wz/lbbbvvCegl9uvFK4QoWYgYMy5nl3Oz83mT2OH9AHETFk5HqqIX7mmc2NAeyIpuKnB
 DtRssjsqO3JQ0aYVpRvfh4Nw3v/EmZam6vFiWatLPL2JSIkmRumcOzGoTrMcBetB2lFpXEToQ7B
 LV90cSbZ1bsSEr3FHuw==
X-Proofpoint-ORIG-GUID: QayhkXWN0fZ4XguwcbaTHJrIwNwszGh9
X-Proofpoint-GUID: QayhkXWN0fZ4XguwcbaTHJrIwNwszGh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_115121_391421_13B8342E 
X-CRM114-Status: GOOD (  16.13  )
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

On 12/11/2025 7:23 PM, Krzysztof Kozlowski wrote:
> On 11/12/2025 17:44, Jeff Johnson wrote:
>> On 12/3/2025 11:11 PM, Miaoqing Pan wrote:
>>> The firmware-name property was introduced to allow end-users and
>>> integrators to select usecase specific firmware for the WCN6855.
>>> However, specifying firmware for an M.2 WLAN module in the Device
>>> Tree is not appropriate. Instead, this functionality will be handled
>>> within the ath11k driver.
>>>
>>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>>> index e34d42a30192..0162e365798b 100644
>>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>>> @@ -37,6 +37,7 @@ properties:
>>>  
>>>    firmware-name:
>>>      maxItems: 1
>>> +    deprecated: true
>>>      description:
>>>        If present, a board or platform specific string used to lookup
>>>        usecase-specific firmware files for the device.
>>
>> The driver patch completely removes support for this, so is this really
>> considered deprecated? Or should this actually be considered obsolete and
> 
> That's silent ABI break. I will formally NAK the patch.
> 
> 
>> completely removed?
>>
>> Do any DTS files actually reference this?
>>
>> /jeff
> 
> 
> Best regards,
> Krzysztof

Krzysztof,
Can you check the v2 to see if you still want to NAK?

https://msgid.link/20251214025230.716387-3-miaoqing.pan@oss.qualcomm.com

Thanks,
/jeff

