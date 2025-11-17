Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5A3CE8D6B
	for <ath11k@archiver.kernel.org>; Mon, 17 Nov 2025 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xbd/M+85Vw8s1cKki8JfY2ECZPNgUg55KrvYQLAi4hU=; b=yvC4+IDhN8XVpp0D4frGK6GFe5
	z9sga6sQxZMVLM7ny/CRwzKzEImRolAc2nQuyTiFOs6kis6NiLSg2I2/f1CgZsxQO/bNXMRoqZUxV
	dRbDTNmLyEtLcx+N1W8p1GyTn0n8/KDNhY13MtjCFzo/JcCEf3zBSNm4akgart5HgcKiigzUDTgDJ
	asFWkaeZhqqahVaswwTCqdj18Zav1mu8JnWREYHiq+L1Ue9n6dA81IlCu3RIAjTlgYDU63SN23vm3
	NpCiiHhRNxuTnTQjqV9mFlWhFn9IslzGLxIFhgWT40LFAvhJQ3PM7+WmWX8b0JL/K+ig5xZtlT/OZ
	lBiRHLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvic-0000000FoFL-23tj;
	Mon, 17 Nov 2025 09:40:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvia-0000000FoEH-0Hss
	for ath11k@lists.infradead.org;
	Mon, 17 Nov 2025 09:40:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nldS2790796
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 09:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xbd/M+85Vw8s1cKki8JfY2ECZPNgUg55KrvYQLAi4hU=; b=LPELYkN0qPh8NQVx
	ho7nt7iBoDbMmvC5nuYX1Oom10iPvtqeX4anvlzr66M0t7I7FF5asu0UWTakDuY0
	vzoHVQy7k4K2WOusrA+kkwFDoFFdwSZdweenQpAxzTAlmlKs3gTRCW6A8kfNJdOW
	hXp2DY/Jd1uZcg2CJpbh6ZzBnbXF2S+Ny9l8ca7MvpGCM+cEY8PpnhTt8EgVRvrb
	XW9iANvWA/m3NMVMmdRSxHngAKgON8uZCbPox00Ugg8lIJ1RhanZ9qp+0avsLV2M
	RHbG0iaQJg3gVJWPJYFyPYQus75wz+GgaFF7PmR7wzuOT7cSttH5EmlNs8PQ4pvB
	YTn8Jg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bh3ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 09:40:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29806c42760so149723115ad.2
        for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 01:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763372415; x=1763977215; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xbd/M+85Vw8s1cKki8JfY2ECZPNgUg55KrvYQLAi4hU=;
        b=BkXdQMLetQvxDZo6Qb6BFj7WcPfPTwPMeK1uCWUJ5F/j/9PxY+vc+U96brYlH7Q2pf
         oJ+VeCULe5OJFRZoJQrnr7HBAW+j5TBj0BUoPwWGLbsiQpGl7dtQo6RpGVJFXfUI15fu
         Vu34SAkXivkMGx5tNvtf+EvVbf4b2Ft6ZROSOMz18oa3mZYxTHTQouzjcyRgcmNkZ6wO
         +57WwShmUHoJ86g+rzLNmzGeXOs/Zv9zUqMdunDs7N82+jVbDvLDiFKJ2sg/eK8wilmN
         q5HMZ+nDokLrLdc3WR4SJY8MnaDsbApZOcJDEnWnrx+9KRaXoerQv15Y6gKI0TGk0PsG
         PHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372415; x=1763977215;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xbd/M+85Vw8s1cKki8JfY2ECZPNgUg55KrvYQLAi4hU=;
        b=OfwdYPjWcycfQcxJ3urOpgddUZDPWA/fqpQe8amt49YdCrqlSgDYva48kD8doktTx+
         1rLVGAaCjsRcCJTGf9/SQ/SOp05CDcmAajNGEh2ldVkgVc4eOa2S1EP4zp7mY+5mYn/C
         IZH1qfGa/MRsmSdW2snHA6Hqd0BvgCL2uyYLb2LyiZ34uRic3u9gESclbDtwpOEize6O
         ynnl8cGjdwbDWMtSYkFZO3Rti8nyOeuHmza9RCygTIQxbdAFNJ6dqkKVm/dmd98GUjIG
         JbV4koywU8zNV5ID1K8d+ASHgNalDpGtEbSdKZ+rsrsd2AQ+Gv+1y8YBcnufWKqh25Is
         gktg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Glqmf4gPjoz82xDuzoERUi6qmbBVNHfBP8/TXbAu/QFr7BhqOoM9fQRQSm828BqZSMFzvXs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxsTbaXH85Aot86U2ZOiq4oSItv3HjgExYh8MxyiZ5uUdafLoo
	v7ob6vfkzYPUNGWOt9Rj5eAiz2oOWMEg2+ghkHZjVf1Fkj/9xV0+6qe/01C44BzdQ/6WBZtvNRM
	prYmxir78w6SiXJVlrTgjuwX0dTs12av/upjgdPqeELVALV2hT0hG178SDITkha/s
X-Gm-Gg: ASbGncvWGmz6rKGlCDHewWvtoX5vRenowVCtzTaMqLy53qYQtsgwahxgB55lh9aATIz
	ktufbKAVmn+oGsa3L6fkkBpnC2oHCooxWrNgbX2gbLTqf98ZfRCP1XDCOsMohbar+oiM+RBMXpJ
	wQTy2b7Kz5bmsBCBoYia7+WZf02A0p/rh6dH/mwsureDXo6a1chSGmZswlJ0PDRkudEw4vDqFk1
	X/0cG/TbFYCs568Tfh8o2aOeDTbJ6iKlCh7o51Rxb4ntI3G7xSL7pJGJHUOJzQJ+WR6cRGz+pKx
	aLKuLN20JS98k9W4Le+goDwzYR3/8cwkw49mwZx8igod8gXDIt6hOSZlLKDIpfg0vpqhFIcSf8K
	kQwIwC00ORMgD1U4qJ+CLonW0noWjU0nnoImC6wynJ1kVzHsYMHJ26/nDsFYIcBKhErMp7XEU
X-Received: by 2002:a17:903:286:b0:290:ab61:6a4a with SMTP id d9443c01a7336-2986a6d0441mr128562365ad.13.1763372414784;
        Mon, 17 Nov 2025 01:40:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFddAeopk9ZsDGbTtYli77j8FC4dnPHKzaKqbT7rUM+u8ZEVTzlfZ/5emnD6ZwaUr3gOC+XcQ==
X-Received: by 2002:a17:903:286:b0:290:ab61:6a4a with SMTP id d9443c01a7336-2986a6d0441mr128562025ad.13.1763372414315;
        Mon, 17 Nov 2025 01:40:14 -0800 (PST)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b11bfsm134601665ad.53.2025.11.17.01.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:40:14 -0800 (PST)
Message-ID: <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 17:40:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7eLSjtJPKsI8-E1_qMUVmQUtZJVzMhqZ
X-Proofpoint-ORIG-GUID: 7eLSjtJPKsI8-E1_qMUVmQUtZJVzMhqZ
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691aed7f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DkQbIERv6x4r1F1n8LQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA4MCBTYWx0ZWRfX82vhrZz1hTw/
 r0rzCrCculbucCwMLeUj4dRbvGh5QM70M7M1migjx7+9jJcIN97kCmeHgBRk4NGUWzek38PqHJQ
 yMue6Ls5IbIoQ3fbHW1feo8KWRiCG4GTF7wR2Ww+tUF0JIpn5Tic4k1TrBimSdicCyGPe2uYSVx
 nFvIqU02Yam6E1pivnx+yzpOsutrKw9v6/5xQl0oclEsDI7bCLvXWuMn1XQ/pHFzKdT5k8+/3Bq
 ZLLmNT3ynQqcKzESD9vmecqoL/JLOHOgv+/YXJTtyaj33+IDJwq2D/DqPPgX61h7y++pKTW7zoJ
 rAlfDzbYiJqHl/A8dAfijnWLsSoS8Hpg/OhqS6Q1XK+KuYY16yiFS69Cstz3TommuFljk3tc+Ls
 NLXeG4jofFa0gS0F0IPq4F++01tC9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_014016_123443_89A665C9 
X-CRM114-Status: GOOD (  29.44  )
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



On 11/17/2025 5:00 PM, Manivannan Sadhasivam wrote:
> On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
>>
>>
>> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
>>> Hi,
>>>
>>> This series aims to deprecate the usage of "qcom,*calibration-variant"
>>> devicetree property to select the calibration variant for the WLAN devices. This
>>> is necessary for WLAN devices connected using PCI bus, as hardcoding the device
>>> specific information in PCI devicetree node causes the node to be updated every
>>> time when a new device variant is attached to the PCI slot. This approach is not
>>> scalable and causes bad user experience.
>>
>> I am not very clear about the problem here: is calibration variant device/module specific,
>> or platform specific? If it is module specific, why the lookup is based on the machine
>> 'model' property? While if it is platform specific, why do we need to update devicetree
>> node whenever a new device is attached?
>>
> 
> I think I mixed the usecase of the 'firmware-name' property in the above
> description.
> 
> But nevertheless, the calibration info platform specific, and hardcoding the DT
> property fixes the location of the WLAN card with a specific slot. For instance,
> if the board has a couple of M.2 slots, users should be free to plug the WLAN in
> any slot, not just a single slot where the property was defined in DT.
> 
> Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
> property is irrelevant/wrong.
> 
> PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
> expect it to work.
> 

correct

> However, as I learned from Jeff, calibration variant property is also going to
> be required in cases like router boards where each slot is dedicated to a fixed
> band and the calibration variant is going to be different for each band for the
> platform. So unlike I thought, this DT property cannot be deprecated. But going
> forward, I'd like it to be used only in these special usecases. Most of the
> upstream DTS have a single calibration variant for the platform and for those
> generic usecases, this static table should be used.

If that property is not going to be deprecated, should it take precedence?

> 
> - Mani
> 
>>>
>>> So to avoid relying on the "qcom,*calibration-variant" property, this series
>>> introduces a new static calibration variant table based lookup. The newly
>>> introduced helper, ath_get_calib_variant() will parse the model name from
>>> devicetree and use it to do the variant lookup during runtime. The
>>> ath_calib_variant_table[] will hold all the model and calibration variant
>>> entries for the supported devices.
>>>
>>> Going forward, new entries will be added to this table to support calibration
>>> variants.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> ---
>>> Manivannan Sadhasivam (2):
>>>       wifi: ath: Use static calibration variant table for devicetree platforms
>>>       dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property
>>>
>>>  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
>>>  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
>>>  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
>>>  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
>>>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
>>>  drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
>>>  drivers/net/wireless/ath/ath10k/core.c             |  5 ++
>>>  drivers/net/wireless/ath/ath11k/core.c             |  7 ++
>>>  8 files changed, 115 insertions(+), 8 deletions(-)
>>> ---
>>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
>>> change-id: 20251114-ath-variant-tbl-22865456a527
>>>
>>> Best regards,
>>
> 

