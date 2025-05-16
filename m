Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B370C3ABD8
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 03:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9CUjuI5toNO/CwE9P7BAHwcm5bf++miBkuAeuRBtL4=; b=V6fMNeh6wpIsX63LtrUznTwrL1
	71vXQrtQxBGGvtbjF9Kpk7qT0G2SEnL7BJOU0nopHAmLByZWsBCPr8pD5RbfdrqOWMtFWhMXl6WrF
	xtGt19lM88A6/4qz6otCaradDxWxgV0m/X3BaYcc+cV7aOoJRHzVrIJZxEHPpFKP5Q7SoRLUPpuSY
	8l6zc/5MxADeycVjpOr2/Qk4JosdBKwRN8WKcIFBekwSE+VgHAmYE2NrfL3NKno02z3u+K/w4VRA2
	70OTfiwFcV5o0oBUW/Hq6/6I+cDDbJKMlXak/B/Ctk+NbcLoeKvrPqWhXyqHEDTY6ZuWaGxzKDD39
	VVYQsHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFm7A-00000002PrJ-0cOB;
	Fri, 16 May 2025 03:52:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFm77-00000002Pql-2Ich
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 03:52:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3XpDB032604
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 03:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e9CUjuI5toNO/CwE9P7BAHwcm5bf++miBkuAeuRBtL4=; b=X96b3wRBcf0WRTJg
	dsLx3ec0XQPLO88LulB7qoNoi8DeuWQBCTHJHZJ13rs6zhDTRaQJ2PsiyounkY4x
	0K7xpeFdChjthCISlBcPkf9SnMNKGNku3ObH44DBlj4TL3GMRxdYVHDtI9dKjmww
	kCaw9J95OdEVvVwk7U9gn0qwjm2yKtyFfNyYt24ofXSwAu2frmq3krokMSA8fdYR
	V92yRjmoRrsY3t23WTqFdYmG0tltUzn/sVbh5XljZU8PxwWkIAg7KqWoqsY4cXl8
	L1Xl9F7+QEpQdOGACSUGmk97FxvIeKOyrWztxYE303AhyfFPwMzAoJUeZy/kHFVy
	ZIHQdg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp0dxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 03:51:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7394772635dso1193859b3a.0
        for <ath11k@lists.infradead.org>; Thu, 15 May 2025 20:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747367518; x=1747972318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9CUjuI5toNO/CwE9P7BAHwcm5bf++miBkuAeuRBtL4=;
        b=G/YFVsPn4InRfAjnnwIr1Xz9sM58bdMuZrUcEgxxE/3yjn4Yu6VZYHF0sgtCyCg9gU
         GXeHn86HaC9bxYfrn0NsQQwDi9+Dyvkqc6Q10lqj/VACaJNJAltVpXguj53NeEarYviQ
         UN5kV13Dvlo/crIDjicckcZwyUuO8gn0QV3lR4fw2NkwWvWTxvwt8MxT9j7aw+MGPH+l
         YXFWCdY5TCO1RNbFvGH5dyonHipop8/mQQR7HTpaCDyAA0Dav9vvVlmoiR+hnisioJ7v
         p7w6X7nn16+XS9s+z73W82ruF/1cansMKACsAp1IQVNyeZungFSDb50V4Q3lnLLtRdO7
         T6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUoH53s3NCqt/H+QGDpOgyDRKdFt7pSDOcsXuGHmHvLev3jpwMBhLEimPKV6BfgfeheqkOY0ZA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqSBWTUBvXLS5kBe5zRw75gCkcnlIjOXJra8NpsVJQmDx8cmx2
	pw6nkEBs9PKAnpsmjBvVTJzv6iab7yjpeBQZ4AHP1mwVCAOlcXR2x1IDOvOaWrUh/jndmJixtZI
	OVNHDr+fkPNSeCc9vYlv1WBIf7tztXW/A6BbYQQjjKEjqOIsSlo0l3erJVp/eEmsMJm2AvOzC
X-Gm-Gg: ASbGncufWMgElea5rFZj2cpxBHl8bT8Igaw+73FK/tXJ8jHx1+bheS6c7HOAJ0ZwMNs
	MtO7D5dlZJ2w2rFO0NJp64YsvfK6qk1pwNLZXPnu+XxEAu3mU/KaXq1tqiVl5R7f6kiQR+tEFqY
	CLWq1dLXobbr5+KvWrpQujHx5dYeaWS+MkG2Fl42a7YEHWFFjJ3rZ6lmU9eIq+7D2nKTeflTYC4
	dOvgSD97A9z4Um32WPDiIFW3rDEke3L2bCb0bWqs12UDLPQ9GNHtxLnszWozYAIk9V82QCsKFTX
	aMZVSsSAuZYudC5SNUkG5mNl7mDYW6x2Y1ZnhjoK284qobbisTNk3A==
X-Received: by 2002:a05:6a00:6f27:b0:740:6630:633f with SMTP id d2e1a72fcca58-742accc555bmr1441408b3a.8.1747367518473;
        Thu, 15 May 2025 20:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuzA/K9vXNzdBZ+rdc/yclBLrXdzfPd516G/U+MHxZQNQqIOscd16rlxENvqnbCHXktqkUrA==
X-Received: by 2002:a05:6a00:6f27:b0:740:6630:633f with SMTP id d2e1a72fcca58-742accc555bmr1441383b3a.8.1747367518056;
        Thu, 15 May 2025 20:51:58 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a3167sm580089b3a.166.2025.05.15.20.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 20:51:57 -0700 (PDT)
Message-ID: <c6ecda76-bfd1-1aa1-ca2b-33a9eea418fa@oss.qualcomm.com>
Date: Fri, 16 May 2025 09:21:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] wifi: ath11k: clean-up during wrong ath11k_crypto_mode
Content-Language: en-US
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, jjohnson@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250515222520.4922-1-rodrigo.gobbi.7@gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250515222520.4922-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UruTeVtZHIuKsdWz34FvonARg0HU764-
X-Proofpoint-ORIG-GUID: UruTeVtZHIuKsdWz34FvonARg0HU764-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzNCBTYWx0ZWRfX5mUfL14ahwue
 0qtzxtugm7JGVeDpNB3VW+TYV+qTLqG7cMexN95Yjfut86lKb65grGac/OXpuqD+8qgm7q/a0Nr
 4fdtmoCciXz7PxYTFAX+8w42DM+poAlY6OQNDiPpxQXtvbwv4nBs3kP4eCcCbM6vX/OVZ7eOKds
 Fnb2KsBce6g4THZadDy9Y7utQnNe5hblFF8LQ+38qJSBVV7GME4r0JjyZ08ppQV+ip+6UV4CZ0k
 WsL/mCGF7DJtjfhNEPhzo6s9wI9sdj8uGajxb4tCiYxbN0qJicjTPg+dekczLv7qp/EUl7DiVi9
 eghR4A0ewZMMM18p7rSyM19fl7yc0Qmt0lEu5TNhCYxaouKYAlQxFJlT9fVdGhnNEuYeQ1aWe1b
 p97x6iHxMEgWz1xU5gwsZPfN0Y8FivL4Uw/YtRD4D6hGdw2dWsIrGemF28Lh/R74obrS2HFI
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6826b65f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=l0rt95YCMWEmbhB2sSAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_205201_721398_C838D8C2 
X-CRM114-Status: GOOD (  12.98  )
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



On 5/16/2025 3:52 AM, Rodrigo Gobbi wrote:
> if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
> ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
> started/configured. It's reasonable to undo things during this condition, fixing
> the following smatch warning:
> 
> drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
> warn: missing unwind goto?
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Changelog:
> v2: add smatch warn at commit msg
> v1: https://lore.kernel.org/linux-wireless/20250515004258.87234-1-rodrigo.gobbi.7@gmail.com/
> ---
>   drivers/net/wireless/ath/ath11k/core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Forgot to mention, pls use branch tag (ath-next) in the patch title for automation to 
pickup this patch.

