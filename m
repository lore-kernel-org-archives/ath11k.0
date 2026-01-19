Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBD1CA5FE1
	for <ath11k@archiver.kernel.org>; Mon, 19 Jan 2026 01:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOvdQBWjYZXhCIlZ66x3GrM29+gZ2gMcRylv0MRQCG8=; b=Aq4RjtIcP7f1rI0VGnXNwBFVgq
	E9yZsCnZb4AaGvv9urYkgPwbG6qJgYLZK+a4A+MTlZjl9C5V33M6R7qzyGpAniwfndj0BLY00COkz
	x1F6OtpFPtF6Y/w1zq8AXBaGQhOa40h1yhnS6sLHuSyyF5E5SNmVhokF7AgUmw5rAD4ALupI3F3Oc
	jf6DpLl3NuVBfkwM+64v0AqTLdua1pAhrk2eIWzZOowi+bWVDOQMbXPrUYBXORqHRUeaRX2mHRbx8
	SVbO33eJ1KEnZqoiDXHKt5DlOu4vnQZMMKbtAh8WprhcTh+2IdwPTrhmI42IFJ5EVnzfXk+lnW8XT
	eZu3mjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vheA2-00000001Eth-1EvZ;
	Mon, 19 Jan 2026 01:34:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhe9y-00000001EtL-3iQC
	for ath11k@lists.infradead.org;
	Mon, 19 Jan 2026 01:34:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60INgYq6707910
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 01:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOvdQBWjYZXhCIlZ66x3GrM29+gZ2gMcRylv0MRQCG8=; b=myYNhLUSWKWQV6iq
	XUr3MoXG3IAjYcV666prFefSHXzxLoxVClBTwY9osmYFrba6o2pjD/4qytYKH7qT
	UKeNMl0bjCT+OhVgx20eS0dauXbx1rReNJf6lVLXqkJofovAe1x5jYqZvde+dEtq
	ufeLvGWCyCPsWpuWUikbU/WQ1dc7UYuj7gg0bjt2VXhqUuRxfRZRHurdsjghKnGN
	j3qKa9Hc5mPa7H/x+rYBvifzQjQjWayC2kaRzJ3g37mJ956cXn6diL8Cgh8w0Iub
	JHsRPr4hkLJT6O6z6dvkYNRV2VL+XF+h2EELno3m0QNSM/opLNsALo4G77q02z2G
	J4txag==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5kehg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 01:34:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f5381d17dso3170647b3a.1
        for <ath11k@lists.infradead.org>; Sun, 18 Jan 2026 17:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768786464; x=1769391264; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOvdQBWjYZXhCIlZ66x3GrM29+gZ2gMcRylv0MRQCG8=;
        b=dMzyqd92G1N6gk7qCGHCj45RxI344UClGxzN5hTcwvgAQdNjVjQ/iJpo+fa9t8n6gU
         UG3gW/ammk88BveiJd581TdZMUmbVqSIftXvcjgxi9ZLmr8c5M2kw/LMOyAH2JYtY2Kp
         EUl3sg+BW9IPifdH2f0DabJiqln1XYDtJlhJ8hW7a2I7jopUxMBeX0GAgBX+xSoO2ASI
         AMbLmrRyFGH+jng2ZNhE01maXkl/cGzgqcjFZcEhAXTZ0mO9/AXR6UlqXU9thg2avzt9
         N1NVciTDDBSkdZ7M3H2/Tqg0YMVWrGQNZNffZJKa1Vav10ktTH9dbJ6j9pK9WnQ23VXj
         D9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768786464; x=1769391264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOvdQBWjYZXhCIlZ66x3GrM29+gZ2gMcRylv0MRQCG8=;
        b=IVsFrRoeaUZHnWfc5JGgj+ESLC8QrRcqKnQv2ZJ6dotpojItAYWSAfVYFIGqCtqaGT
         U2Xu76+lbYq+8kfKaysxxK4OXzqagWX6uHTBIUOT4BmDYiV23/cjo5FtHPn5ogLJiz0u
         +kFzkiqwYp0sjcwiIRR90icg2Zk8YsR8Fb+Y1HCeu/c4+6PjeGsusIyaY+TYHd5RGtRP
         IxI7HGD1vBhOQrQ7MOubFkElMCsZxzCgevHiuKiq6KV7FRwqtcq8w+Mf9qhVjC4233iu
         LWsTXP2gOpcUaYwyukecRbdulAykr8F4WOChKPViIhFkBr/WNaXIVdwX6tWced3E/zHG
         MS2g==
X-Gm-Message-State: AOJu0YwVs6oofiXd57Lf7BNtDllR5RjLjHfgDRs5m5X6RwciVrb9j1l9
	tT39K9kn9InKSI+lstrlyB/mwihBj9J1KVRVM1yHixJ3v977hQHRO99Vf9DrNwAidn2sZ8SSluE
	nUpHc8rVi2oSac4NhCyanU/hWiLCNvlPDix90vieT3vfszi7oZgD1rdIA6TQN2/Jh
X-Gm-Gg: AY/fxX59a5AySePyad0xFIM+JS0ULGkVrbXhMW4774hW6HKjlq+vv9/6cLxegyx7tM0
	UNmYM66ZQHto754jQX1jxbdC02YMDTxvU0ZGCOPuxcVE5OhUN+YfLXRcvk6LE7BkzXpltjA9EPz
	qgMPg1X+GqFRiL8/ImsAA3nWvROTlG9MvjxNnWqDS5dT7DAGTBOcf+34xz669tCmUJJeDPVNNM9
	/Kx615x0fTsGY8LZbWpHJhGcB05Ow50T0HetxI9esJgiJXtQOu77+dHSGMlmFt0Xsh0TcWNzVQJ
	G2gG7awa0q42Smh6GKDiPxfO5b7M88jLBPHRS7KBARff4zJlUYGIxee6HUFvl1xokIex3WsMNzr
	VehTy+07C3lErHsPM/LeuZGH/RQQmSP+I68ywnem4N0BLk1gl79NQ7pYxlMHrBt9Xi8ZUKAnwuf
	+0EeI5
X-Received: by 2002:a05:6a00:1407:b0:81e:81fb:b391 with SMTP id d2e1a72fcca58-81fa181fee4mr8040799b3a.45.1768786464102;
        Sun, 18 Jan 2026 17:34:24 -0800 (PST)
X-Received: by 2002:a05:6a00:1407:b0:81e:81fb:b391 with SMTP id d2e1a72fcca58-81fa181fee4mr8040784b3a.45.1768786463569;
        Sun, 18 Jan 2026 17:34:23 -0800 (PST)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1277a15sm7499351b3a.42.2026.01.18.17.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 17:34:23 -0800 (PST)
Message-ID: <4562bdbc-9811-4f73-bc4b-f5a62ba1c965@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 09:34:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 ath-current 2/2] dt-bindings: net: wireless:
 ath11k-pci: remove obsolete firmware-name property
To: Krzysztof Kozlowski <krzk@kernel.org>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251214025230.716387-1-miaoqing.pan@oss.qualcomm.com>
 <20251214025230.716387-3-miaoqing.pan@oss.qualcomm.com>
 <fa997674-402a-41cf-9334-f7fc89ae5ebc@kernel.org>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <fa997674-402a-41cf-9334-f7fc89ae5ebc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAxMSBTYWx0ZWRfX7nqpsuAo+w1m
 gukM56RF1uNbfcrtaXEGadyNprd6GZRdNdZV61WA3egPCngwpheT6axR6Z7qk3UIKyyi32fE6kJ
 xvDMxvei0AsOGb9qhJ9aTUSw0nqg0v4Jd98VTIoiN1nixuRxpFhkwKrhzeJUYIojbK1wjHTRGaW
 29fcfTh4I37+eQ2q7XIJUpGrbSxdJldlG3QnVLnaGYq3ErI/47ohb2hWsArbaATmpWwq1aoEXCH
 U+zJSDHlb2NFCFqhASiGCg9NQTlxmeT2+LPHunS8RF6ljvi47Ik2giZxPZTs31p87ovq3/gnypB
 wt40QRsPx+BVoToay/nJemRrx5hHiGg85ARV/6+TaBCIe4nPnDXxbv0aExLetMvKo5v8VlwA8yE
 sAVa9IBnGF3SfuWoZzt57kc0olVy4L96GsYHsqLa+BlJeyvEunoMHgmmJbr33vfliCgiS6QGnWA
 JCuVqFnSvXJTkj+Tvmg==
X-Proofpoint-GUID: NwXx4Fk8vmDHOq_USwgr_cwOypj4E6uy
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696d8a21 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=a9Ey2deuWmHcFssUcOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: NwXx4Fk8vmDHOq_USwgr_cwOypj4E6uy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_173427_055068_300A6CED 
X-CRM114-Status: GOOD (  24.27  )
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



On 1/13/2026 3:28 PM, Krzysztof Kozlowski wrote:
> On 14/12/2025 03:52, Miaoqing Pan wrote:
>> The firmware-name property was introduced to allow end-users and
>> integrators to select usecase specific firmware for the WCN6855.
>> However, specifying firmware for an M.2 WLAN module in the Device
>> Tree is not appropriate. Instead, this functionality will be handled
>> within the ath11k driver.
>>
>> The driver has removed all support for firmware-name, and no upstream
>> Device Tree files reference this property. Therefore, this patch
>> removes the property from the binding and marks it as obsolete.
> 
> No, it does not mark it obsolete. Point me to the place.
> 
>>
>> This is a DT ABI-breaking change, but safe since there are no in-tree
>> users.
> 
> It's not safe. What about my board using this WiFi? Or Mr. foo's board?
> 
> Still NAK, you did not improve it.
> 
> 

I think it’s necessary to clarify the background here. As you can see 
from the git log, all changes related to ath11k firmware-name were 
submitted by me, and the intention was to allow the lemans-evk, 
monaco-evk, and hamoa-iot-evk boards to specify dedicated firmware for 
the WCN6855 Wi-Fi chip. However, the Wi-Fi‑related DTS nodes for these 
boards have never been submitted upstream, because adding a 
firmware-name property for an M.2 device is not appropriate and would be 
difficult for the community to accept. Therefore, the original approach 
was abandoned.

The alternative solution is to propose a static lookup table that maps 
device compatibles to firmware names. As a result, we have not submitted 
any DTS patches adding firmware-name for those boards to date. This is 
why I believe that removing firmware-name from the bindings is safe.

If this explanation is still not sufficient, please let me know what 
additional steps are required for accepting these two patches. Thank you.

>>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> And that's a fake tag.
> 
> Rob never acked such patch! Adding tags for something completely
> different is not acceptable.
> 
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml   | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>> index e34d42a30192..653b319fee88 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
>> @@ -35,12 +35,6 @@ properties:
>>         string to uniquely identify variant of the calibration data for designs
>>         with colliding bus and device ids
>>   
>> -  firmware-name:
>> -    maxItems: 1
>> -    description:
>> -      If present, a board or platform specific string used to lookup
>> -      usecase-specific firmware files for the device.
>> -
>>     vddrfacmn-supply:
>>       description: VDD_RFA_CMN supply regulator handle
>>   
> 
> 
> Best regards,
> Krzysztof


