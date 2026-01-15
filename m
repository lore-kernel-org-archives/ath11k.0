Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D859D47CA5
	for <ath11k@archiver.kernel.org>; Thu, 15 Jan 2026 23:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyBSAugGuEeuvYZ4IecENAE/B7++Wdg8K0nB6NRo6ao=; b=itvODcwN+iNVzlQbMIvlfmIUWq
	Bh2azQDQBgJAHqR6A8dVnHRRU5Myw5rD0becSxafbn2SBUL9SmRChrizAs6gkX6AoNa/+quce9m8K
	kUtxp5uScEclQzNaKsS2gBx+PPBnfCH9s7mYcdpYxxrHAv2MCTHiXSUw3AyKYyvoz5pF+wdPp4mq+
	j9rC5Fga7ZCt4GwmRIOss61XTmpTlL/UauVCY65GDFaN4kP4+5hKQrtga3OKD5+fa2Xg7o6NRiUYm
	rABIDIUFeyPGuT7+LgCjgSk/8FkwbBYSqDbFonP3+u6256EupHn4ukS+iZgM3KQ3IlFsE32q/QSGp
	FNyDwK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgX4S-0000000DL91-07qv;
	Thu, 15 Jan 2026 23:48:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgX4P-0000000DL8G-0GWy
	for ath11k@lists.infradead.org;
	Thu, 15 Jan 2026 23:48:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbshq3759167
	for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 23:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyBSAugGuEeuvYZ4IecENAE/B7++Wdg8K0nB6NRo6ao=; b=X3WVWNP26YCG74if
	CAiNmyDgBOtzcy9WXiEZ/eFxHOikDSfe6FjNSvr3DIN4IXzQQeFNAtMx3wYdSO/B
	G5dzGgtGfvsdxV+RM+ydZPArFIhnv7NUCYAixf4Zi/EC24oEtQQDkERnQ4tr28D0
	srB8eDhL5Fi811iKEG6/xQDAGHm0D9OGZE8xKjZEmdr9Jo9q6MMJSq8iTKnaiWcu
	nI+M8xprfC2fj2tyoc3QykCEX0bAQn4padS7KvA9TrPeMPd+VWDwZQsrcDluPrjd
	HYgIgyrt72iiANJSFEUSxcZ9UzznpP8eahaN9mTFiJJzREqGadZecMxRL9146ezn
	CdDDHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96sr4jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 23:48:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso1358519a91.3
        for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 15:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768520882; x=1769125682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GyBSAugGuEeuvYZ4IecENAE/B7++Wdg8K0nB6NRo6ao=;
        b=hJIMIPBOxbCTwvd7BTEmmvwnnua3FWvH9W8Q6CGG8OxSD+A7uWXtEsGoPJYWbXR3TQ
         tVD6/7zfRUeJvLtrSospH+yQmfyR2uloacaxKRmWE0rXB1j71d2yhBfxUNkOl+sXSCuw
         stxbc9jL63KrhyFJcizGZNxJnvQxlXYOAhN8kEmih6Fg+OwNYl3ymJbqgkIWOByHXnrP
         f6yAt5730CKM/qgaYINdq4QQOFifIQGzGr/+fxFnGJ6ihPvo3gn42U7QJPz5aqeBBo22
         q9UyD6GI4YVGW+qBlouSjeX3pLTWcn913IoxP5O+p87TBqjlqQ/vDY01yJCtlhQysjn/
         qOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520882; x=1769125682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyBSAugGuEeuvYZ4IecENAE/B7++Wdg8K0nB6NRo6ao=;
        b=fu8q07JK3f+dK9w0jIJdeWMp4oHbqrI0eGuD8QrS7bv1khDPMKBYWcNU5CiIqWr9kb
         LKC9WbsocgFqY0kEAWRBUsSgXIsaruwxDCqu6IZFTKBxq8xPbGRBWsQ+988jWh6kWpMk
         50sOtNpmoSs9hjJRYaiROnOQVQG//B7dAmEQV4FQ+ucT6XBx4tzFH/7RgjtwI+Dm6Qxw
         +SccXzB93/+GpR5ttkKyRRpikUnqUOtBEQE02cR9oLQlQ3rrCQooG73XtIEcchshlRGZ
         E8ygPG/mTVbpi/1Dv6AKrebH+wo+kG7qLb7L7KqZc12R/dc4TZwOquVq/VVVz5ra15Fh
         TmTg==
X-Forwarded-Encrypted: i=1; AJvYcCVflEVRWkY3Nljy3dTS3xTLx68wwas9+GXlK4dWdfF7vFlTSHjQJcIyxRtn/prdmdJQgaGuRnc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMvgHC2fv0PnFkYm1FgdJAoT56+I8SAo1RpS+Av7Ug0OcQkmwM
	aRROHg6eZ48DOk9qXOEA5sUAiNVb6VVp9NicHRiajBXRx0TDvUcAVweBtCrNE1teJlrxu3pw1Gd
	ofQwkHU4K+2GuNFq/L9Ym2JnLUWxa/DcHGJMimXcZRUUoo1Yaous4t6tmem/fDf3S
X-Gm-Gg: AY/fxX64q6bkwEum5nEcqWIWrij7KduCddWpuTpdXau9EPXtqpQ88aB2aBvP19V/vwZ
	DzeG3HV1qd3IcONfRB7NXepU1ikDRmCHRZ+Hxz4drsHyCTR4FCYo4Uk+ZWl1X0bTpS32/vxomla
	khizjVBf/c+3oS30gP772iE9Ys3j3XKVbyQ4pfOP2KE5kTioMwG+GNtxyPzviXT1k9ruwyeq1qf
	To/6wZwWyXVeD8q0llFbmQjncb0DK69y7WH21m0LEJPxiv/MvA8X6LW4U92LryNMfFaozV5/kcE
	Cf7pYyeKUXQ2x3SNrI8wgqEOMRjqXOYweNE9RdDUetLveyD7Ir/NCQPDGHBlTsD7bcW2Eiqrm+8
	kXC7iTomUP9atsSHkzA56iZO/ZGdvrGzvsJk=
X-Received: by 2002:a17:90b:568e:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-35272edc45cmr952771a91.15.1768520881682;
        Thu, 15 Jan 2026 15:48:01 -0800 (PST)
X-Received: by 2002:a17:90b:568e:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-35272edc45cmr952760a91.15.1768520881171;
        Thu, 15 Jan 2026 15:48:01 -0800 (PST)
Received: from [10.253.11.195] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527310210esm427320a91.9.2026.01.15.15.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 15:48:00 -0800 (PST)
Message-ID: <0f4fa27e-d9b4-4a23-8c8d-53f4a7014167@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 07:47:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Yu Zhang <yu.zhang@oss.qualcomm.com>
References: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
 <717658b7-91da-4073-a746-a389319aac2d@oss.qualcomm.com>
 <a7a73ad1-0761-4abc-acc9-fc94a4e77348@oss.qualcomm.com>
 <f0e98751-8fed-4cb8-9cc6-59a691f172b5@oss.qualcomm.com>
Content-Language: en-US
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
In-Reply-To: <f0e98751-8fed-4cb8-9cc6-59a691f172b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=69697cb2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=TqcbJbPLsSPoifzPepEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -3foqVJvwPiRIyVc1M5MgIHF4A8cyNqy
X-Proofpoint-GUID: -3foqVJvwPiRIyVc1M5MgIHF4A8cyNqy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4OCBTYWx0ZWRfXys1vfxdeiKSx
 sU2seERAUlFXDVnBV9u22S79D+d628I+K+IYAGNBgLnlKw0i4OTzI6MdAt6YZen1pn3pK7oexZq
 fFdzTxyH+jms1RS1Z8C5oqHDVHbWdlMs7PqFfVJEPUJmhNSA1F+FJx7u84ix8vGnYNnuGnlxh03
 wA3HtiUL/Pry0gdDWwazWTUNRr5QZM3nuhhS5waZNRxI38dLNGWqwz3RFu309itB2X9s3jMmOEX
 n1oPRA39Tc13TaqTg+4qqTupWpmrHesxdwVzl4j0qZmLJGh71ajUkKANfqwRMDnMQ7vuOJN/HhE
 ++IXDzvVL16AoSJLPPRfdKCvexSoQvNDSUFXG+JBOqzQJ62rOrxK1x/daBzNFDVnBFDX61Rbdnw
 yZa0rV3i26JJ/GFgus2GV1Pzo9lmnbNloK42fWf9h04IMpOSByCK+zeHWT2pNX1FAcXzdlq/Yej
 gphUGRCmu1M+hl3z36Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_154805_245090_2C522973 
X-CRM114-Status: GOOD (  12.44  )
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



On 1/15/2026 12:55 AM, Jeff Johnson wrote:
> On 1/5/2026 3:51 AM, Qian Zhang wrote:
>> On 1/5/2026 10:22 AM, Baochen Qiang wrote:
>>> On 12/30/2025 4:25 PM, Qian Zhang wrote:
>>> what are these dependencies? They are not present in old revisions.
>>>
>>> BTW, if you indeed has dependencies, in addition to these prerequisite-patch-id's, please
>>> also list them explicitly in the cover letter above.
>>>
>>
>> These dependency details were added by mistake, and I will remove them.
> 
> Was that the only known problem with the v5 series?
> 
> My automation flagged a checkpatch issue in the 6/6 patch:
> WARNING:LINE_SPACING: Missing a blank line after declarations
> 
> If there are no other issues with v5 then I can fix this in my pending branch.
> Or you can submit a v6. Just let me know.
> 
> /jeff

This feature is under LX test now.
Patchset V6 will be submitted when testing is finished.
Fixes for new issues (if any new issue are found) as well
as all previous reviewer comments will be included in
the v6 patchset.

Qian

