Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A23C83010
	for <ath11k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qeZ7GCDwUB0wspAU08ExZecso0WhfdKZDuLxMXJ7fs=; b=Toag+ojH2MhMENGAF9mnDBusBI
	EEZnPzhiD/2BJkxTCV4OMfpB6JdNvsZdbvpq1YRpOGUo0VnAEl3/WG1gJcTHVaYvSRn8Z/0X9boLB
	zbRqJ4zTmt+i5zX7AUIep7Uio4IQmf7Jl+DC/LfF/SgGQIHHAWiBl17Dpr9gn9Tlk3ZhOZKsxUhCM
	gjsjB5qLbOMKC9RGHJdHm8PbEbJ6pYN2P8oEw7ysT3+6nquZegP9BHobZNPdumRIcIHW0hkz48HH+
	IU1NDXu/S0Ue6yH5Hjae4U1xq3AFVnytcJX3XN2r5/LAz4hvkLWKVkOUPkUDIImfq2gubJ/5HwsGP
	U8HyOu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuS-0000000DCOy-0rtp;
	Fri, 27 Jun 2025 00:25:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoU-0000000D1yN-1Pxz
	for ath11k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QHx1B7018656
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qeZ7GCDwUB0wspAU08ExZecso0WhfdKZDuLxMXJ7fs=; b=AjRecQy6cI8VaFS+
	SE2vE1IhdWAg7TpT7iUi1GWw1yVwM9GDdkk2rPA+ruQegG0lvKiKCcztDh4blgj+
	HtBACWWnz+mVm+LvYOA979gt7d4F5CK8EmIvKw3fWFSnNlubaRobU59Gb4IN4eeN
	1UkbAe4AKr6K4xaOc5ac16cicpz4PG1YPBTi8E/ZfRYjKwir7WrpofuOBkv6wY1n
	FsjOIvn06JiMZ2gSe7gSCtOxX3lpdLZ2V7v0HhhRC/e2ftRXh99XnSktg4463nnw
	wfomzo6Wc8DQL94cIXHVzrYMbT5DOihlagxpqosx/l+kl3nIpq6beyRi0xmo4yk3
	Xzvliw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26f644-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234f1acc707so14483685ad.3
        for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979712; x=1751584512;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qeZ7GCDwUB0wspAU08ExZecso0WhfdKZDuLxMXJ7fs=;
        b=hoPb9AsFyQagbCuOTb44tVRMRSwZ9UXu82t7n8NOLJ8n1nfgfnKz2AmuU8A4S67PXg
         UJMfWnIFVax7axmxe7tX0uGaDDcq029TKc5EJePutJZjYHRt9h5o3QU/53B3/BUirl7/
         ws6N2gsnpHGDaxxXokj+sP592KLyV4ZPFlgKIYmojCbgEKyPd2YFAbRwY9OokypzRzRa
         URfGo0+G4h9P4jsxOqlLqROkpZz8X77nHlQFZ3rDkYxNWz7GCy5866V5O/AlHO85kPBz
         o5vk66d/pa/qDtzFE2CHz968AUjccgCdQLMy55Z+ENhZvcEvtylr7fJpnjqalV5h7HJ0
         PfkA==
X-Forwarded-Encrypted: i=1; AJvYcCUtSMqiuWaYHuL5JGvK3LEdToDZTlWtkaRBDu0N01mt+8e6V3uemcNKuFnn000i16OJR4o8gXI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxT+0ZcfXYQJipsS6cDddML+xw8MoIeyQ3KFaRyWTX7stOBagoe
	GkkbvrFLfLM6itxxsKK5VAppIrqlbZLrRGIRwcdkV8KayKYv8I+ImXaybflWj9z2bioWdn4ujlS
	D+M8Bxi7+sb/kNyYwg2ryY8jmB9OqGX1hegGO8oii0dxajvxGekm2BJZFjz3c55lQ
X-Gm-Gg: ASbGncvU7PA/qtPfKUB77Wmm5gp9NOKAmBywK1btjOKhDpL+1cs8es0u1m53aTNxLwH
	Lg6xvquG5cthBs1v54di60o5rsNPoyx7OvNNGR3ckKDvoqZbxLsg8DGnKmvOGuILCxJklpPq5sh
	/k7hbFbYx6aO9XGdKt7nfGwofqteFIpK7wEdDB1u2uth1lxsgOh0BaDvqE9Ze9RxK2kvaCAeOgt
	jTks2G9POOd5qiW9n6lbR9jS8+eRbdotlxytT3a+UUbGIYsOKMRh+AZccQVAd6mhLKQfTLu5du4
	TK1WGEdtejKRad8TDKVEKbK89/1/Fc13FIEJgzo6u4iplmfrTPVvbTNV9TY=
X-Received: by 2002:a17:903:1a4d:b0:237:ed7c:cd0c with SMTP id d9443c01a7336-23ac2d8b52dmr14889055ad.11.1750979712429;
        Thu, 26 Jun 2025 16:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2tnvUr5R4y05/ayA00IpnhQO2OSLo2b43usy4w8q5lhNvhwx+xftIt+XJU4+l2F8VfIaP4g==
X-Received: by 2002:a17:903:1a4d:b0:237:ed7c:cd0c with SMTP id d9443c01a7336-23ac2d8b52dmr14888735ad.11.1750979712045;
        Thu, 26 Jun 2025 16:15:12 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250612084551.702803-1-senozhatsky@chromium.org>
References: <20250612084551.702803-1-senozhatsky@chromium.org>
Subject: Re: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed
 srng lists
Message-Id: <175097971130.153431.12728903041387632447.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX/4jbGEXTdFBP
 5AwPGezrlSF+qTyniR+AtttboCG0d9+0z2/zDsJ6bCgtqZBt2wMEdsFWcPRohAtE9CY5ww2TKj5
 xF5NrcEdfSW+Xs13P3j3/a5z0i0OGmFOlZ9c8u2p4o07vSf19vQkOKw9dPBZqWdl5JcqqiatALP
 sgMzP/DmAH21Epb8dEWYTv52nXvYF0iInXn5R8y1c7nWaMnwgm0wK4jUAQTQJAU14TArDAeC8X9
 h57IU2iBRQAmg5VbTWJoYwzuDMmIPUtnsx8OufyETvhMc87lhCJdFZ+DwKX/5EsGhl4VGguxHVh
 aktYlweRC6MX9kzAhKsZC94x1i7afbFVL5A+DDzDtDTYg2cF2qv7VGmeAw6IhtL/ZdUyDGa++Il
 EKlWlCvuAxQNaNURSkppHwbG4C8KA9GQinFP8Y3ZXZIOvQSrODzL2X/7oMm6mM49HwZ+2Y5m
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685dd482 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pd9zJXUkC5-qadN-W_4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8eCYIKrSZIv9g-l86Gj2snsh8k5aZyRy
X-Proofpoint-ORIG-GUID: 8eCYIKrSZIv9g-l86Gj2snsh8k5aZyRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161526_385753_1E7CEFA4 
X-CRM114-Status: UNSURE (   9.97  )
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


On Thu, 12 Jun 2025 17:45:06 +0900, Sergey Senozhatsky wrote:
> In a number of cases we see kernel panics on resume due
> to ath11k kernel page fault, which happens under the
> following circumstances:
> 
> 1) First ath11k_hal_dump_srng_stats() call
> 
>  Last interrupt received for each group:
>  ath11k_pci 0000:01:00.0: group_id 0 22511ms before
>  ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
>  [..]
>  ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
>  ath11k_pci 0000:01:00.0: Service connect timeout
>  ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
>  ath11k_pci 0000:01:00.0: failed to start core: -110
>  ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
>  ath11k_pci 0000:01:00.0: already resetting count 2
>  ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
>  ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
>  ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
>  [..]
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: clear initialized flag for deinit-ed srng lists
      commit: a5b46aa7cf5f05c213316a018e49a8e086efd98e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


