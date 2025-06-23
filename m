Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB4AC7115D
	for <ath11k@archiver.kernel.org>; Mon, 23 Jun 2025 05:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJaUpKWaloU/fOL7e/dgz5PF5xRAJF3ZohSH7tC3q8o=; b=4ffSxYdC1Mvy0k4JSD+3dhrsKv
	Hhq/ZkKQ1QUuB62XiEp57FqHNKMwbdIahv8IT+1fUTw0FXFkavlWV52VNP5hdNVoB+8jGmssJ/ihx
	kArACaozPGeci1pgIxMf+xYVBTxU/OauKMZWjIvsBAle+i1RxJgVBwP+LFDbWqUVif4f4oD1f2/Lb
	q/Ql+hy37WHr6ZbW5+/RdFLyqHSSE8lPgklRRxjgGo9T8esGs26vVLgLKjqXPNByiu14mMJ2YubMW
	ywHMvnvHLzTCt+iyYfq79LbSPXmB4+dsCEy1EZYGf2WJN/nKtNErcUGWeCufdJclxDL/2uAuhR4Ig
	TigmjfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZcN-00000001bfp-1aGt;
	Mon, 23 Jun 2025 05:21:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZcK-00000001beG-1s9W
	for ath11k@lists.infradead.org;
	Mon, 23 Jun 2025 05:21:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNWuEc030835
	for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJaUpKWaloU/fOL7e/dgz5PF5xRAJF3ZohSH7tC3q8o=; b=TownxR+uzJuqqY22
	KoYUnXvx8s+YZ/yUUriG9339Eb3p/1eyAHQVikqRlU7uZRzzW44XI732s2ouzWw2
	tYWef19edun8URilL1g2xE0izHw4DsA1jjjwKRwcAv/z2fBTkH6VWOFSiYhWglb9
	Pzo5zBurDSCljsmldDyb2OjoinnGpmeH/VywkkHmMwTDlwGO9OiCfkTKdAWcohNM
	SFbEOqf9z9ucvXefHh/SZM/5lahrAvJX31VSaI80ZD1HrtTRjORs6n/S1QTWQpVV
	HrUjB6apVTGDGd6AelslDd68uv2rVtARtF55Wu10+xibS3p/bQFwGirPo2TOcZGJ
	nofbyg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7sm9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31c38d4063so2414492a12.3
        for <ath11k@lists.infradead.org>; Sun, 22 Jun 2025 22:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656074; x=1751260874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJaUpKWaloU/fOL7e/dgz5PF5xRAJF3ZohSH7tC3q8o=;
        b=xEnSYK/kZbv+Dh90bQnf6ZBL98lYfE656usUZqHjIoECGuR33uJ5GjnfRowbuCsB5v
         XbwrZ/GsJC48quznxfRbwhi+0cHZa23JornGe4QGFz64z00XODfhMnIknRv5nuime1is
         dMxSJJWnYGnT9v6TK3xY81/9DMvVX15PPWaoJl71suj2VJBbyD13Z5ibIM3DKGJTI1bz
         /Il+NtgvOsQ9kpfMFwHUEJlyD0z9bkoihiIE9dnq2We8XY+4JoCUXVh96ys1aG8SSttA
         djm+26x52jEjOm8LtAnqf5tMPdL5tyZ+UjeP74Fud5Mdku3FSMxUh+C5uM3CTPGDShos
         g0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWRH28xAuERlPZwKnqjk7CJr+A7AZu4D/UZAKm+kIaGktQDglNBIYneOSqptdZC7HxkAO4e2us=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6HgJXD/RtYelopwdPXmtNCKXwyxEAN51pejQyfow29YLJRDgM
	+M51GAYW1ak7dTlc1e0O00aSq7yQ8zQPFRYtRZKGXD5zUlqr9qM7vlodP03a2H2GYvu4YNPk7z1
	CvD1zZBVsB4nwPcCQ732OpIKA3Gvrm6ivMRuuM6ZtqvV+oHG9+11D8kaq25tMOkap
X-Gm-Gg: ASbGncv3WaZVCjgWMYRwwZ6QF9ira3WylO6P/B4Yc5KpUsC032IZIjq2EVLKfOTPeKH
	DBCSkXFhH7TDejqJ11T8J/rywfCzXwAI670arY/4eALw73KmyL5Rq8iJZvPSw+t+d2MIQiOOB5P
	1QzWvpnbJr0/DWX1gV/RxacTLadgxR0icdFrlZbAg61Yg4oCGWAyqw2wsm8Zr3WqkkpSZalWCoC
	LSK/VFFF9SeXF3hA9NZZHVM8cR+8jAu6/F40CkqYF/HFgryH5mRlSbdVrwVHm5pMswvlldmGwdg
	Vycef11XZqX8fI4mVmI7Svw+sSF62ogg1basMUnVMcmuX+nyb66fYF2icf2g4qIT
X-Received: by 2002:a05:6a20:438c:b0:21f:62e7:cd08 with SMTP id adf61e73a8af0-22026d62492mr16734646637.8.1750656074022;
        Sun, 22 Jun 2025 22:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN6sXlv3E9PXQKKHrhj7infmrUZxL1XGkkL3NJcuzzaEVBliA6CDYcfDWdSI/EDBJMpScx2g==
X-Received: by 2002:a05:6a20:438c:b0:21f:62e7:cd08 with SMTP id adf61e73a8af0-22026d62492mr16734626637.8.1750656073657;
        Sun, 22 Jun 2025 22:21:13 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b32075895f6sm4116924a12.21.2025.06.22.22.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:21:13 -0700 (PDT)
Message-ID: <aa9c4dfc-5b70-3893-73d8-ef590189f937@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:51:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 3/5] wifi: ath10k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 15Xm_FleYE417NBfnbUmOjaub-at4H-j
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=6858e44b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U89tM0JWt6iRefauG40A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX7qnk7fGqQXT3
 pKO07eO1Mp+iC+vx6MNMeWEQVBqu/RtrMEqqIZJfgwXHxlRK+90el+Oj3+iVmVv1tGbHvzXUDNI
 ZX1AeoKFVE4CqKhUoa4275sSw1HKsmXOGK8OlEGrqjIKCXuzCiy171PFq1/5c39JR5EqIKHyRpH
 so0kN+tUGswbhdBnirTBt29D4kJIKCYPFu61NqFzV0K3jj+fryjWw394nOBnbSocl7G5hfrKtJm
 40FO0Gojfwaw+Bm78xeuWCKN/i6iEZW7xLfcOgKJd2nCn9qEzzA604wIdVLubLHjHx5KxqbljXD
 XO3CLyCLrSPpZXUTpwJmDoJmRRr9cunm/xS7W952/6GcQDB5oOkir6TarAU6RL/X1WcxqSi62Pd
 kL/u9JDcRJ6NuEHxYMeSYPKn+s7T3kZlrAtKZk8qvAuTZP8KGTmO5KHt00iaMRVXhVLkfYlt
X-Proofpoint-GUID: 15Xm_FleYE417NBfnbUmOjaub-at4H-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=977 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222116_593982_9FA9179D 
X-CRM114-Status: UNSURE (   8.85  )
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



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warnings:
> 
> drivers/net/wireless/ath/ath10k/bmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htt_rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htt_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/mac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

