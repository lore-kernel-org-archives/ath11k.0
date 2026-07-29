Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8C8C53219
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=effUasZEjaIUw9frOwS1vdJdOBJ4XcOUr1VsAXvecLo=; b=qneuRMy+x8gdUMBV9Bc6RITn2h
	tooHs3Y8sOpoTcK4E5Hssz2FG6OhJUr/yACb2qMLu5Fbs1T/1b5mRjN6aYwjnW7Dv0rOrsuahruxl
	H9uUzAxjiEWnP+Ypb7tAxtXkvB0ayse+VlkZgkLEUPn4Hsy6OSGBOlbVUOBr+Y0uaw3OLZZSJLl9o
	CfTUcYGLwYyhf1FZgxakTsMlUgYLBwDEYP3HHIgo9XGoVNcmHoWd/60NrCGzoHgws6w26bhJ5h1cX
	Ed8kno5m6Kx+NYZy+JrshZG3nL05rvNmh6SzMyAPWvWzl6TtpCWPFCVl9IIs4j0d4U88b4nM7AXJy
	BcZgTkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8pY-00000008nFn-0IxK;
	Wed, 29 Jul 2026 18:16:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8pT-00000008nFP-3XCX
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 18:16:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TG3ETU2247435
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 18:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	effUasZEjaIUw9frOwS1vdJdOBJ4XcOUr1VsAXvecLo=; b=A+cLvlGXunEClfrY
	U1nlS+t4HL4E2lY+tFomuf6Sjx/5Dr32b/z9Qhylr6o1nRTmsxOT5mr6eyaU4Nh8
	XgKWAiWHtf/ZShZ4yKpAbHDFWeDXbNS9ke3JUIiHXwEFH32y2LZRzxTUe7JKob0M
	MQFkE7m/1cZeUbWS7YP5aajGWo6sGWHK7T+OhZdHzI0oQkv2jVFEEfmkwRQ98KhS
	yXb97pllpOUHFx55LoNgKHvQxKeh/OKW1S3oSL0Zm5LEDzYjvYPIyM2J1KEihdge
	NQlPAzzj5jC81vhXHe0rH7FW8e6HpUjagFIayTkjAaMNwsWgz4NMQfWU5FPHGDtm
	jVZSxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqmpygq2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 18:16:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf6acd760cso15709385ad.3
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785348990; x=1785953790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=effUasZEjaIUw9frOwS1vdJdOBJ4XcOUr1VsAXvecLo=;
        b=MZoYGIT7zqf1zrnLAXINQNWsqp4IMa0KoO+jLjT0P0371E0NGrzxZZk3a1uHdiuUc9
         9vrmRIKn8G+wLQburIH6MspNjLyCNoKj1EO9ikPoED51C77i/fdTr5ok75Y8csgEHzMd
         +aC9CTCzSwi8P/heTznQoUZm9a2Ulvt+U0FDJ+N4SFljgfknuA36mRNypbaX3LGoIy+6
         KhFoZI6HTT4EYk8ClQI+wvfN8vMHf1dZ4SuF8VM0RXiFp/8/F6Tkf9Hb+mA7SG1MrXOO
         bL4xDigkEDkXDeScbbDAtlmYmLTpOlOXbw3se0c/E378uqOWA4ZGCmxOMInBaZClQS74
         Y9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785348990; x=1785953790;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=effUasZEjaIUw9frOwS1vdJdOBJ4XcOUr1VsAXvecLo=;
        b=ARsEocCb7pwE1DmqeauPSc14G54tV3EH8fxx7iOmaMKKwDEuSFIqVMz+XBP1i3NNYG
         U3Vzm23KiNEagkmpEz7yMeRheBvY0AoglJEbD9oKboGfYamtG7snBLBXAUtAR54g7JUy
         LeIm7E857zsQOMjOI75NdixgluJhg99wQTXsROBVh7/QSmow/HuydSzyD2ANptXrx1ml
         k4evMC0vxfOCGTJCeYWxCTZpPuTe9w36frGEy7pMTY1arfSp5fZtXfMBSxh6XFaKV3fI
         Xon2Hq3z++5bjmHnv2s+80K1I3XbWzjMt4id/WgqOuPqHf1a7px1xD5VqiUf2Tet2hQT
         +hMA==
X-Forwarded-Encrypted: i=1; AHgh+RoVHCLX5v+SHyMEF8kRosGsZlb1jo+bVcnSj519piKDZo5TTbp1AECPuVg8ahJJn3X4CVdolGk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxJ9fpnvqklXujsAvHTVE61RxqF1lvOuPZ/0KOymqndH5l551s
	ldPfx8uX1Cwz8rVXSvii0aQjtGMF6h9lPX0R6AgyVkDCaLwyPlN+QLAu08kts789W2dJSQUwNZO
	9AJvDnxe7XrlJ83TUANOH+aC1+LEqSleU1T2PyyG0ucPuL+IE6J4NechnNDZWRoU5
X-Gm-Gg: AR+sD12tvxQGaTI0fpWnGMh4zQXanBG4fTcpjnEUtZZ5p87iInmmm7afRdStR4UxRgi
	QePxdflncVv2TnihnTfOOcZIH1L5XXkWgukwPkOMmuSfvUA2eciHaxDdc9I7qL6dfFhMEY2HDA4
	y3BrTknkZGXjaKu+E03l1jiP8V+pr6A6Nf9Efmc5SZMbzEsSQu7SAbHyWalzKcP1tfh/owskQkX
	Rd9Vr096PhKEsQVxyCAwMWwtZyGnodKD790YAJv5YllZyYoQKxHR+rsouvp/JGCbUwrHsxwn7LM
	2A8HR3DKWHAQCPawCigoHyY9f8PdF9qFG3EsyPY85vHmUj/1hhqFCPwbyR2m78HehtRmGFjIXwU
	OozhcViFxK9FCvMwhNzCCa6KMAkhQaeZaHlisy466b7tyKCnmwH9cx52QQDT9
X-Received: by 2002:a17:903:2bcc:b0:2c9:aae1:a611 with SMTP id d9443c01a7336-2d015d22f5emr89066655ad.23.1785348990433;
        Wed, 29 Jul 2026 11:16:30 -0700 (PDT)
X-Received: by 2002:a17:903:2bcc:b0:2c9:aae1:a611 with SMTP id d9443c01a7336-2d015d22f5emr89066475ad.23.1785348989971;
        Wed, 29 Jul 2026 11:16:29 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc6936sm11649667eec.17.2026.07.29.11.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 11:16:29 -0700 (PDT)
Message-ID: <592c0749-c3f9-4156-9624-edfa360cf53b@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:16:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath11k: reset ar->num_station on
 hardware start
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
References: <20260729090347.3488257-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729090347.3488257-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PYrPQChd c=1 sm=1 tr=0 ts=6a6a437f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=0ats4XXwyQKhd1xlIuEA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 4_i9-PY2Rp_JbyhtkFu9BaQjsVdl_xz5
X-Proofpoint-GUID: 4_i9-PY2Rp_JbyhtkFu9BaQjsVdl_xz5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE0MCBTYWx0ZWRfX4YbcGrWGq7aZ
 ovd9BKcKid0C2tno1P03GvumOpb4WWMh3JNNhLOlyDNqqTX5x/iwkK3iBR6I7CvT4SBNA+7SCpo
 6/LR3vkSqYLwn1ZFZymA30g50kZREfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE0MCBTYWx0ZWRfX+JY57ZhTqxng
 HphcHLuPb1x+ASAP0wy96aU0zO12H8sHbh648J5sOW+3mAHDAsOV3sKLJlYQXQjIi4H4RYKIxv5
 35q2I4bkPvwPCb50yFDDy5zGoXtXuNf/nBGfrvzawiIguxSCr3Dz/m27cXy79C1tewfsI9q+mBy
 lE/CrtmFxsMcwCoOqdUrIsypeeD/JPSVTG7kOoSIgeGkqDH4q1e5h8TLgnvQ/X87VEPs+kPTl7e
 gPSMt1AaM/6FMo45LpSfdtgW/3M0X3hRddnBIWPkK2qfcwoBw+uTc7vS9lMwkRLUjYT/NRH8ELW
 2hfmSp9g/gqNc5L32dz9/FGKNTLqdj32eqpVszR9Z1kLoIUqoHB9p0nx5bqf/WdnQfljT7meNvc
 Yl5anhJE+dYiwwZZMBqGnpeY/0Q+MyAimY41joAFIs0bPo1/r558oaYzWzINt0X4R2VVd6nhfdw
 mNNs8e7zzLN1xtZEjoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_111631_892752_F5F9B0DD 
X-CRM114-Status: UNSURE (   6.64  )
X-CRM114-Notice: Please train this message.
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

On 7/29/2026 2:03 AM, Nicolas Escande wrote:
...snip...> ---
>  Sent by mistake to ath12k list, sorry for the noise

you failed to send to linux-wireless so this isn't being tracked in patchwork

please resend, making sure to get all the required recipients from
get_maintainer.pl



