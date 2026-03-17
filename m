Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C122CFF6E85
	for <ath11k@archiver.kernel.org>; Tue, 17 Mar 2026 21:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=; b=YjtoMtW3lDtwm26iMj6UFxMxoJ
	8nOpB3WSQRnAlKA8UlsLtnTcp8ZSzqkL6fogqm9SrYTTr9ZloegM+EpMsCvGa/d5QdGovgF4V6oky
	aIbWYc+oxE8MjVXbDSA8nYv7jDrgSFHafSxT9rIs02zKWG/8m8HbMu9KjAkuNUH4um8gHcn0ggBv3
	ldJoIFAHOnJwX2FK74TY7Ru6d9aCtzcVP0IvIds3dz0fe7itJoTAD5QbVMf/aL/H3ukuiYROoXGQQ
	XD902KeUcPFP/i0F+MsJQ69seTWORnLicyT7vZMur97EbzDstp2TRpkHHHLKHxRsK237E6pMkR7mx
	WfMu/FHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bpT-00000007EwZ-020Y;
	Tue, 17 Mar 2026 21:19:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bpQ-00000007EvU-0xcW
	for ath11k@lists.infradead.org;
	Tue, 17 Mar 2026 21:19:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJvEp2294949
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 21:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=; b=U4A9jp91jXJEnARF
	xCpT5KTWmJbVolgd+qrizSi+kJ5qDiVJzVlHKEGnkxmAco3RI4KWwCNOAvZdQ6Ie
	cjyhcAZyXT8naCLLpw61q6p7124mSHr8fqJdPoMxHfAgShfjWbQgO/TZMFZo/jaE
	otu1XjhAVA2zXzlOCKOve4Y21ywKl/xrs1OSNX3GjxXH4bW0agSyTr9zFtFx4OsD
	De0eIfsSdoBo63SgVRRtSgrFtt8czC6XfJChbfHBF5Z6v0PLGYJSKELp+xKmx6j2
	uTpm/3arTwpKuCAIoYSOBozeWGU7sdqZSq6whf2C/77SG0N272ziuhOA73kebwOW
	oth4rA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83s2e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 21:19:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0cd2e4aa6so10222979eec.0
        for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 14:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773782390; x=1774387190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=;
        b=ELBBdtRfRUFwmomILHS9mocqbf6bAJsFRXtdmFtpARCdgRVpNiUdfddmQyG/AKxQBr
         vszU4BEmK3g2cIliPw5DTQ0TTgETUaIzCJog62vcLiUhbEhJDlDncZmDMWCg6BKMmGyp
         kEYUJR9KTXHYlYdWQLwqEXT+cineUdVLCJ4uKXbY3Brr8VYKZiIpkBjzPB1dGGP6ULYb
         UpAxiMED6OzRBwjpH2OdzvA5RdHDkNGOQ5OLU8Zw57BZqxs6cLvP6atF7p2lIPnnPHre
         xawIXWH2wkKJroMaXFEYCNS9SG/sl+rlbZVBXSGB9rxcqksYazgXgXM2lvJ9lHVcah4t
         u6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782390; x=1774387190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=;
        b=PdhtJC7RixuvCdX2qx64SUuiOQMm6wemTHZL+yCfKTs7pHgMMNO36l1KuPV1Ak0PSp
         DT7NgfSNTTCh3BWS/HKijXZfr0iI9wkk6PwUlB1+N7RQaQO5xSwuqbx0s+ocQwAgBzJT
         agk0XSOPQl4h10OgfTBb/BkVUUTXJsjcEHNkGuwc/jzz1l1KBRIMK0gV4pmrAXLSOGQZ
         0pmqaAEcDaklgs6SQfTfV91tERM4ZHG39dFzvyNoA5O4XKA6T5no8t7RxNi5RZAYzePh
         j26mPnjAES+b8ocF2uU+/Gydy4vCsRyAuoyjUEHUzE6DVEW2KZ/fiaczpDfKqcC3N6Ef
         2HhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Abz7Ks8QN/qbvqQLZ+VZBCuA4p4GUYFlPgvvR1P94tKY4ccUcaOC9kWE0unZA+iH7kOY1Ws=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh4iANQ1RtIK5o5OdLbbt0s194PsIceqZG8lerC2HKwIsJx6x6
	Truu65bvv1UfWW/5cz4Jlo5kR5wMqIt3Lw0OEI1PGGXr8KFE/1VqNNCjWsMO0pN8Pl8TZvF+HBK
	rsKZX4eKfhZT3ZSTlm1I8PDMyp9l/DSATcTQPWBKizw7jWkw/ZG6xLGVoubVZitgp
X-Gm-Gg: ATEYQzzMxNH7ohZQ8mzJEfrhat2p1Z38F4Qy2mb1A5YbxNApNutKbCf3z7qzIUDs1v0
	NCy0GFJYAnte/ZgAh20XJlcn/XItRc64BMVtqzX/Z4R6AVSg9DBs5TE/sOl8hipccD3C1gdmiQq
	0TPQ3cTH2/OIg1IC4/ldLEufnLR+b+cW/NmzDzD7gtZFdaxV67vx4+zFLRfmHQ2zIey052Q+d0/
	2dDO7Zfip82o4JEU8JNnTMBHlIoSyFDomTRLV9v9JWU7u7gWXGAIzN1LJXcDOpWwiCvlK7GMno7
	D8I9nGW35AoFVDPz5swqLebO62B/JznB3ykWc3+hFjAPqnoWhLhoxRjz8igG03s+7DJE2nBWvak
	LK/VNUyg8dhtCSqb7+3dzbZBvGdNL9i0j2IRe/g1pTNno68ef5inbchgLR61hHD/58lVrGf+NDu
	SF8A6Ddshj7sjhgw==
X-Received: by 2002:a05:7300:fb97:b0:2be:9886:d4cc with SMTP id 5a478bee46e88-2c0e4feaf75mr548373eec.3.1773782390468;
        Tue, 17 Mar 2026 14:19:50 -0700 (PDT)
X-Received: by 2002:a05:7300:fb97:b0:2be:9886:d4cc with SMTP id 5a478bee46e88-2c0e4feaf75mr548358eec.3.1773782389960;
        Tue, 17 Mar 2026 14:19:49 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm970898eec.30.2026.03.17.14.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 14:19:49 -0700 (PDT)
Message-ID: <e22e4dc4-a98a-417c-9b18-8836ec56ff56@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:19:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260317
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
 <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HVvYXArPvxPDAGGF45ov3Wj-7SvFGQ4e
X-Proofpoint-GUID: HVvYXArPvxPDAGGF45ov3Wj-7SvFGQ4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NyBTYWx0ZWRfXzj3CbeNZoApl
 R3hEkDIKc7ZO/FLn21bNa9+LrhUsv4Untfbj+jsqmo5aCdAL9ZB3Z3hXNGE6VyM1c/SFpCJcjtC
 iSQo1iFGLjOF8w733w3oGGIhdPf1g04qXlhJwh4Jz558MOEbmGb5mJFwQXmcQce/CDHw9yFvxyG
 Kiq/2S32wVjTWHPX835+CNBsIi7xJy6QQB7+/QAmi7mCt4pUstroQQ5U8iucEcv2RugDLTCBSj8
 pC0srgw/QEcX4HaOYGNuo3MfvmVlj0VlHcfEk4k3uCbV59gh4BTMWwdJC2iPpha+GA2HgLNuQDr
 qckWKrvoz4scWtRx4hXA4HE85haa+RR8nMQ/waOJUSxGxeemw+OyrQkzgdh1lOusAaLHv92IFGL
 k6DF7qkY5v86mbpxghdfMK9sEc7ABmzUUmwLM4S5smeU1QVeOo4dLSEY4OvD5V9FFbWV/VGCy2m
 KFN+SejIBIym0U5r5/w==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69b9c577 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=Lpt2Xbyv4YudqlJ1IEcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_141952_299617_8A89658B 
X-CRM114-Status: GOOD (  12.72  )
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

On 3/17/2026 1:58 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 01:18:59PM -0700, Jeff Johnson wrote:
>> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
>>
>>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317
>>
>> for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:
>>
>>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)
>>
>> ----------------------------------------------------------------
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k.
>>
>> No updates for ath10k or ath11k
>>
>> For ath12k:
>> Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
>> and Automotive.
> 
> Thanks, updated and pushed out.
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/962
> 
> In future, could you please include similar information into the commit
> message too?

ACK

