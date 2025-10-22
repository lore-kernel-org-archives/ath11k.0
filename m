Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF93CCD1AB
	for <ath11k@archiver.kernel.org>; Wed, 22 Oct 2025 03:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjfw9msKx7xfOlkSa84c0dlqx1z7JGX+iCQNM8Ki9hA=; b=yFAPOUF9XbkufYB8bBmKwc63lq
	0qUO07VfAyuULiudaD4w8YhXKqxy2J3zaZN0YPLLlqm/ErZ6BV8oNjZCdHq0d14TBlxG3j9d3mYxp
	lBinnTpLu1dlSqX6LCVVHhANIcBgZOmd6YBguu63topuZR9N9pFEOmHzVuIL3ZhSPJLOg8iculqQo
	Td4ydTN/Vk5DrSvbwkSNJKU1nPZo0smBOoqsOGUeKoMdDb/xCyrNiTHHKEIjclBwz9Os4cqtPjGS1
	ecCiQf4GPFv+sePARaDeVPpHw+wTkoxMsvV2Ub3TMgTCIhdyb8dy2lhsFRGjYqawhuSh3tYPMofxR
	qL31T7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPTl-00000001KFh-3e1S;
	Wed, 22 Oct 2025 03:25:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPTj-00000001KFH-09gE
	for ath11k@lists.infradead.org;
	Wed, 22 Oct 2025 03:25:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M30ar8024667
	for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 03:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjfw9msKx7xfOlkSa84c0dlqx1z7JGX+iCQNM8Ki9hA=; b=GUmJKvyoXB6CN479
	A4sYjHWtTIZK6m2EdL9JNWYZHSPWih0gdSUEy4mPU9QQyZGOJLHLgGg5nt2cA1uR
	OzM0Hu0O17N+mEx+3WyEvGmSDdIk10vOKYVWctOLHMfihoOlSZPZxT+wrdtIoao+
	QONYHWpjRyvbCyZaJJzvceIgLUdM3s9KygA81mPoPGY4/WJEa2nps0UZmOUbkr7w
	Y4uYcm9FonNRd7UaZhmY+2Y7lunOmdiO7to/dc66Fg2VC+BQZcb/Tr+lF5kWZPXh
	09FUDyARNQln8Z+cyUAbhDgvvFSCzSDq3RSZjcWmPd+uML0Qv+xkYTPabmvli4CK
	4t1Zxw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws5eba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 03:25:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55443b4114so3835978a12.2
        for <ath11k@lists.infradead.org>; Tue, 21 Oct 2025 20:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761103533; x=1761708333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjfw9msKx7xfOlkSa84c0dlqx1z7JGX+iCQNM8Ki9hA=;
        b=cfLWkfG0/CWBBBJNLgIR+sN0+RbNeYcd4UgI9nlk1Dm9npoJdrjXpH/QJGKSobLUBY
         oUcWcqFhRnq4vTO7cDhcoOcgfCHkvUur8TJ4VtAMzfwVY8V8uxggR827KkXGpLernWqV
         Fx0lC+Uj9PbzI5TddkMejbArUmX4hI6EEWAxGIWFDWg2hDtbgxyEjpkktCfCTUjkTkC9
         i41s75XG4+whUpsh+J9YgsayDxSQlPzUF9PwAZy0QaM5lvdbiJAVAr9Tr+puFumuDUK/
         5BRd0xJ9V4S0TCqTPKZ1PY2+oXnmAR7WFuE7hzhLyeKdjCjUjf4ocPjSrZhRNbKLYkpe
         fwaw==
X-Forwarded-Encrypted: i=1; AJvYcCW655iDKDqcHUhlAbHZuPfaVQze2EEIqvfSgQzbgDHTwKZXhmlnnzQp5evS2A7mHwf/Yxdx9Fo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBfxTnihQ/IbAonKLqKpGtjXDDS+kgWce9TaUQTQN1BLS5owgA
	STr6EZZYZxvx53QvJYvenMgKx9e1QFm63DLFbJS2ZeqjhasU+oVHjkFXsaZYj1XK132mivzcNqB
	uT4x2ekFwPE4axbHr7CwTt0DzpewbGZ3fDuqJEp8RboXFAbAeEO42Sxx4SqsgRz94
X-Gm-Gg: ASbGncuXqTYqLNZ0sdA6viNjwY9vJUaccS9jS8oyiHe2enxj5WyIzOKXjqslvMS5aG+
	MnthlNTS41zPh0ElzYlb8huFJqsfgCucM/EbtTwVh6ZQF0aCH5PpdTib1UjQUgEQeO1yBajpPWy
	miPzFU7tNLDb7CiFLuTrC/rvJpPlpbvNVYp5etrJCGrM/hW2FUnDMyAjvniWf4ZzfKZ3W9F+8QC
	qurG65Cr9mgF9eHbOHLu2RpBC+PQoCbOysOD7xS/463HaB7ju8Ap8uwtPqfPsQx/KnVokYtYHvg
	A4fzwpaqrbO0u2LEQViKm9t+PN1W1WWF1fIWCW2GOHpvzIG+dr9PeESvh246gY30jsWqCfr5BsX
	LBbDMfg4Hp4bdtiBxwj3d4BOGgmqMtJx1QZPQJbzyW/tdgCChFQ==
X-Received: by 2002:a17:902:d50a:b0:27d:339c:4b0 with SMTP id d9443c01a7336-290cba4efb1mr250800315ad.35.1761103532707;
        Tue, 21 Oct 2025 20:25:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH7Ukk1PJxZsGOLz5xP4zkZ3wO3/M0rmRDWi2+HGPc13CHW4ETBLyTqSQW9AahAE6bQZMKGQ==
X-Received: by 2002:a17:902:d50a:b0:27d:339c:4b0 with SMTP id d9443c01a7336-290cba4efb1mr250800045ad.35.1761103532255;
        Tue, 21 Oct 2025 20:25:32 -0700 (PDT)
Received: from [192.168.225.142] ([157.48.122.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cdafadb8dsm1179405a12.1.2025.10.21.20.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 20:25:31 -0700 (PDT)
Message-ID: <6507afe8-02d6-96ec-21b8-651fbd9b3319@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 08:55:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next 0/4] wifi: ath11k: add support for Tx Power
 insertion
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfXwAfS1ah++fdB
 rTCGsYLMOqFIyBpCjBDetEe1Ux5T8Sm9jTejNlZ4BhYmf+VsUGdLTcA+6sDTAWVXZG1TIXowGJI
 fBbr8nNNvMP+Ongt8QxH3xmncckO0ernQKerJkco5r7voecUTdelWeTpLzgDmLYxSUiiVefuFFo
 pD14WO/FDOk0LW7D05z73xQ/JKZOuR2a4kzJBeGHcMwkbWdj7d+rORVQm6m1GefcTShb4EqmYvN
 75wUUj472YRZXPvUaq4Lx1C9lkoinL16Tx0CY5+/7j+jk+BWEYryMzs0m79AC6RSWGanB6331aI
 8yIGKZsLUL+aqSAmfCn54pN8SWLzgFKXJ8VuHbH/ImpQerUl1NlzQWsfK0vQNJG/Sp6S4vqYrQ1
 VU6hyXu/a42KTv2vcU92LsOigCRKyQ==
X-Proofpoint-GUID: YTmvsDD3W2Mq7JBGv8udqiDvMOWYimWu
X-Proofpoint-ORIG-GUID: YTmvsDD3W2Mq7JBGv8udqiDvMOWYimWu
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f84eae cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=MVWiM3nRykcdLg9H6cDE8w==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9jhMNZ7qWXdoG8tHMgQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_202535_275541_0EE996DA 
X-CRM114-Status: GOOD (  15.25  )
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



On 10/17/2025 9:37 AM, Aditya Kumar Singh wrote:
> For certain action frames like the TPC Report IE in the spectrum management
> TPC Report action frame, and in the Radio Measurement Link Measurement
> Report action frame there is a requirement to fill in the current
> and max Tx power of the device in the packet.
> 
> Add support to populate these fields in the relevant packets. Advertise
> this capability from the driver using the feature flag
> NL80211_FEATURE_TX_POWER_INSERTION.
> 
> In software-encrypted cases such as PMF, skip insertion since the packets
> are already encrypted and cannot be modified.
> 
> Patch Overview:
> Patches 1 and 2 serve as preparatory groundwork.
> Patches 3 and 4 implement the core changes described.
> 
> For context, this ath11k implementation is adapted from prior ath12k work [1].
> 
> Reference:
> [1] https://lore.kernel.org/linux-wireless/20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com/
> 
> ---
> Aditya Kumar Singh (4):
>        wifi: ath11k: relocate some Tx power related functions in mac.c
>        wifi: ath11k: wrap ath11k_mac_op_get_txpower() with lock-aware internal helper
>        wifi: ath11k: add support for Tx Power insertion in RRM action frame
>        wifi: ath11k: advertise NL80211_FEATURE_TX_POWER_INSERTION
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 447 ++++++++++++++++++++++++----------
>   1 file changed, 312 insertions(+), 135 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

