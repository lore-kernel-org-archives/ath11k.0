Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A32BD5B160
	for <ath11k@archiver.kernel.org>; Sun, 14 Dec 2025 02:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV2vPS9sJMuGPlbnmOOt4y+RfDf9VGDtbZyjFlLVeeY=; b=I7Btzq7nI7S6/+G9F12IO0xymT
	SHUrPNhoeNZk5tyaySTvRUN6M/CkFTF4nJzyU7ZE9Et0TQh3wjLcpfepBA/3BxpjqKcEoV7XmlhKq
	DTaL07kFHrFLDU93l4e0vMvwPHxesH3luVrdmoIyAxGIECVJgr2lEXFEl99TvQhvaDIc4f3fcyll7
	OVS/7wl/vqHMxuKGTiH89E5e9cb8EWIzP27RCq0LlDVrE8+mbBoxoxqeKbK8HM8OhmWEA/tgH1Typ
	JxoSB4wajDHAbCv4pv2b2DcHTri2uiDTGCmrA0x7IbBK4Sawm/EiQ7bstFJ+rmEUWxdKlCP2Kf0bB
	nGiOrlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUbXX-000000025qA-1Xnu;
	Sun, 14 Dec 2025 02:08:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUbXT-000000025pe-3Lv7
	for ath11k@lists.infradead.org;
	Sun, 14 Dec 2025 02:08:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BE1DaBM1119189
	for <ath11k@lists.infradead.org>; Sun, 14 Dec 2025 02:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eV2vPS9sJMuGPlbnmOOt4y+RfDf9VGDtbZyjFlLVeeY=; b=hjhsmviw+OH0xEWv
	1DpBs6tGffgn3qzOPshYifYliafhPcx8zqqOYgOOUyWPzF+8u/L8JVFIC3qHQ9J5
	Kjs72sheEQaaKwJW1QxNAfvOzDyw9jciQcDYZKHAohW+H6dx2ByFDe9SEYi9lZcB
	s5HscBxhZJ/NIWdYAd+TAJ7CzCqC2vq/Do1Yu4eTu6lBxBIaKYHDppqmDp46QeSU
	fcBIAXbELp/ft9FSAvSIVlef1d292K58AKVla+KpADovxCVUmL1SgWoWdwkz6ZGQ
	/Rd6wIU2hqrUzYg0ofI42oVb3lNuFV6KfBub4h4B7I6txdQLwKSUNUu+qiIRBsNn
	PNmVRg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7sa88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 14 Dec 2025 02:08:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ac8137d45so2505172a91.3
        for <ath11k@lists.infradead.org>; Sat, 13 Dec 2025 18:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765678123; x=1766282923; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eV2vPS9sJMuGPlbnmOOt4y+RfDf9VGDtbZyjFlLVeeY=;
        b=Oz2N3PSWgN+d4oW1IRmqTeCPdqMgwvlKCSyLrdFft2yuC+N5KnhW6Y07UgN1SWOq1L
         nDvv16ynGcWzQb++YT3WXFlxkQ1XR3nJjvsP93mlZBktkIhW+fAYW68v3WOVPSH8eY6Z
         J885+4LI73VLp7NZL1b2x1sAQOhnlUBOxsjSfvA3udgsV8/U41tmxx81FVAG7nkWvOUE
         I5HAxnpo44JZxwuqgGgOluzSjhgG+sQO8PPMgUw6DTggmzC1IBrFrWnWrpc9kz51SCHE
         jrEibDt8y2Pt25Ut/Rk9tSD9zmtXl61y+ACJy0tjUcr2ts0dmPT6eAN16cvxcvfgSAVi
         Joqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765678123; x=1766282923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eV2vPS9sJMuGPlbnmOOt4y+RfDf9VGDtbZyjFlLVeeY=;
        b=BasBYKl9rgbgTBhVFAlkjpljj4jojk5r4EvRSSf40+jHgakuD10U6ceQL8/Tnt+Iqe
         /q6UKIKPMjds+pnGaGbJJcw7KG1fAzTKuDcOvZtpycUlhFqAsuyvIvf2vEDNSLS0Jzx6
         79cKTo3FG4fwj/VnsmPaUU2fEPPJRgc2xmJEZFRZKE3c9m6MHhD5ZcEaPmwOTDY0ivuX
         heXhias9e3QXoHwKoG8re/A7vtXm/6zDhi2MnBYwDPS3IVl/V9hTfJxzH5KwcYrCPXu1
         IVVWi0r4vuU0y1CwGi9ziqg9EM0yKg+E0nIPZ2BNGNQZqpxZ4gn9NBITOEiBS0yxM53R
         uvrA==
X-Gm-Message-State: AOJu0YwVIdPih/1K9UED6GkTihpFdlTjrK+UFnyWsJc3pcmK2AqqjB2J
	a1ldL0mQQUJMnTxoQE+Y/sZMazqwZA3B9hdzhLnZiWzT+CB36oBMKoErM5lRKDVDmRSpc8aGQAE
	Q32jMYBZJ+nkWbPpJ2iyHfKTjBWUzy2q9dSkNPqYIkl90f5L8vHv7Z4pDrpHyf2R5
X-Gm-Gg: AY/fxX4REpFMc/0p3aMdirHuJGkzBkaLAZ2rsHTNpsJCt1NoOnfeFEIBjF79icxn/Od
	y7y1trdYxBXnL18Yuy7ugerrSM3+9y8LWpqDZad088fCRUMVXRsOQzCdQYvyBa6HnGlWEYgdSfW
	3IO3o9566tPfpfTh9OWGl4WvJ1uF2F9iKWx4arC5rr12GqwFscJUW5HblmLrEsuQBFLEl4BmNCY
	WVUTVaW0aiMjtq4phXTcpMcq4e1iH23KhXEgmYNjH4rIZgHrx3zE2D2Ik7Zdpw5c/JhXdo7Ce07
	93NPS6gW6CAYyjCLwRP3WjNwFhrtlbyA4Tzxr6yiB6ckmRkAbEZpvNEwHTaffgXdq1lLvxSYgsC
	w0XiGn32W6k9ErICdm5BSpyojpZHOostEtMX79SaLbIUWhiRR+RKqXx/JdfMe18ohEhlYzeCHyj
	sUe0lz
X-Received: by 2002:a17:90b:2fc8:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-34abd6c0333mr5843216a91.1.1765678123093;
        Sat, 13 Dec 2025 18:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsOx1VFhUEUQ3J0tBD6Ayef24cfl+ErdI1iQ5B8GJP/1C8VdE0n4fCXQfatWXFaprUhwWxzg==
X-Received: by 2002:a17:90b:2fc8:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-34abd6c0333mr5843197a91.1.1765678122575;
        Sat, 13 Dec 2025 18:08:42 -0800 (PST)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c26515d4bsm8486500a12.9.2025.12.13.18.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 18:08:42 -0800 (PST)
Message-ID: <271b1c1e-1273-4900-a427-370a94c9688b@oss.qualcomm.com>
Date: Sun, 14 Dec 2025 10:08:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 2/2] dt-bindings: net: wireless: ath11k-pci:
 deprecate 'firmware-name' property
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
 <20251204071100.970518-3-miaoqing.pan@oss.qualcomm.com>
 <f60bc80d-a947-4083-9e14-000a937de412@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <f60bc80d-a947-4083-9e14-000a937de412@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDAxNyBTYWx0ZWRfX7vSkECYDwGb3
 mI4FJlMpkQWP9R950V2UzXUAy+ya640Nqv5RVNZ6IMJzC8l5OpTt1eGFRznIn1cB5RCz4KgAKmc
 aFMhRT/JQsFERupx82nNEgfbnuirX+LA1yjbAqLmZElmCppVb9+NxQwu5g0Q2dsRGd5QcPIeQsh
 HfRsHjObxTFIxI0ig7uruph5XEPqMtO9nUgeP7r9yCpzIZACQyGTylEjizydes5L1Ju++iXQG6y
 c7cdFHmSkQ5K+bp7VfY2GoHegJV1n6Nrcpq6lpvrmZZeKTEby+IB3m9wBoBTO/mc8uQgg4eHL+M
 eVU/yueFOG/EdG7PnST7FL4+/rrZXuIYe7ht0UnpN9sDNCRD1Txpz6ScO29Pf/rz806jwRJXUlh
 33J3KYXE5YzTpd6RcRyxnxFFWriq0w==
X-Proofpoint-ORIG-GUID: -K9mfLi5CAXEt6rQwI2J_YZbF4pIvTw7
X-Proofpoint-GUID: -K9mfLi5CAXEt6rQwI2J_YZbF4pIvTw7
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=693e1c2c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8gi6obPNpri618rnpZYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_180847_971469_13D30349 
X-CRM114-Status: GOOD (  17.54  )
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



On 12/12/2025 12:44 AM, Jeff Johnson wrote:
> On 12/3/2025 11:11 PM, Miaoqing Pan wrote:
>> The firmware-name property was introduced to allow end-users and
>> integrators to select usecase specific firmware for the WCN6855.
>> However, specifying firmware for an M.2 WLAN module in the Device
>> Tree is not appropriate. Instead, this functionality will be handled
>> within the ath11k driver.
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>> index e34d42a30192..0162e365798b 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>> @@ -37,6 +37,7 @@ properties:
>>   
>>     firmware-name:
>>       maxItems: 1
>> +    deprecated: true
>>       description:
>>         If present, a board or platform specific string used to lookup
>>         usecase-specific firmware files for the device.
> 
> The driver patch completely removes support for this, so is this really
> considered deprecated? Or should this actually be considered obsolete and
> completely removed?
> 
> Do any DTS files actually reference this?
> 
> /jeff

You are correct — since the driver has already removed all support for
`firmware-name`, marking it as `deprecated` is misleading. The proper
status should be `obsolete`, and the binding should reflect that this
property is no longer supported. Regarding DTS usage: no upstream Device 
Tree files currently reference `firmware-name`.

