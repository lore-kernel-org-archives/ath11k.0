Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D734EC79FBD
	for <ath11k@archiver.kernel.org>; Wed,  9 Sep 2026 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSiISWtT6dWHOCthkdSh/uRevScOeWXykOKuvR39TfY=; b=gEanSIgblAsEYPbiA7SUF3ZcFD
	9UvkMtJjpdGWrysEldjM7K1tsQPIX1ZDXVAbpcv5DcyoABrGBL4CcVN/x5XBs2lGKrdg9Fze4A+2J
	mk6pz201jSAK9UCa964HTaee7X6MQuhgIY5QwyqHF8ApfQjGgjc1cd3wfBvjXnQSfc7QFL7IoYWcr
	S+wc0N5kRrkPm2IHl5MPFGaTVz8JlezOVVcPUmkYLA3hUM3hxFWNdbHtbr5NDCYcG5f5T1AjVKBF6
	nXsOPX5dig8BIns1AWrRP+J9SwJSZNVhOIysV253TW5QDwxlH7PEyvL1CjweFXz7UyLyZOT7B6XX1
	LbWwoZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYI-0000000CYJ5-1HRr;
	Wed, 09 Sep 2026 17:57:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYG-0000000CYIG-2BHC
	for ath11k@lists.infradead.org;
	Wed, 09 Sep 2026 17:57:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H776k1899442
	for <ath11k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSiISWtT6dWHOCthkdSh/uRevScOeWXykOKuvR39TfY=; b=HHGF/z+bPnFdGXFK
	04jQGAdF30SCQ2cD2GJsYwaeNJWRZ9dbC60PpdkfHN9ZNYiUg0MFhgq5OSix0c4p
	lv7Q96+ZanIqBM4tfXZJM0TlettLBvnNKugrq08YZWQCFb2AnV6FchvQ1QJWKwcI
	pOicLOF0ddXz6dO4R8sdpViB4768CcPFcWXLMtgdHAazqP4nJWSYxztTv8v4pVsS
	Xjqh+sGTM1HjlG9qf2zSyb8YlniSGAfJCzQomXeZWU2RMFA/cmQFHS7o4GW7doUv
	KhRAnXoWsdIlf/RU/03WqAoI6ZupkqkxEidSQImueahnYJSNBrNCPD2HXd6nwndA
	YonHug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vhney-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968dfff779so148123a91.1
        for <ath11k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976659; x=1789581459; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSiISWtT6dWHOCthkdSh/uRevScOeWXykOKuvR39TfY=;
        b=Ln3sS0Kspr6iLtUbW3CogrlW15UB2WKG0q1bIH3E+DIYzUXC8t1j8TkqGD5xYJK2yd
         KF3NbAklpigorIHUQ+N6ejLditUP3G0wl2Jnr/HCphIUb2apvOfDUL3V3Ngt0OKLqfDQ
         grJVWxV4guFGE2lEQA/gsTWAoeS8tfqae+a0y1xZACxUCLNVzwliNdwxPKojH16b3pHC
         NedIDvr/I0spOUMAEiYGxiba4P55yla7xHq9dcOOXnjivzm2IsF90zxV/dQeJBNSl9wI
         weXPTjifU760wlcHzhsReoyWKxhIx0smRMiuP89oaCKYA8xkTOnHj160lmN/O7HRnJYw
         VksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976659; x=1789581459;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSiISWtT6dWHOCthkdSh/uRevScOeWXykOKuvR39TfY=;
        b=gERnH655rSeomXzWQqPA6YnfVuLizakJh8JKd8JlCJKHao7c0i4H1VGdE51tuOI6UJ
         RkhU4X77562fvD1ENDMIxB40vpzMwT9PgLCL7HJl1XWFlUNtwC863k9UiSIp7od5h16w
         VF0ByzT38LORdfm6QHTL5xFW4FRqKTMgMKoFShQByj2o8JTHHN+pKhHjs+kk8UWdP0e4
         aN02tj8sZTBqx1VvDAU5gbBsFc5RMI+oRMZby8GKwArsnldviUTKCxftzBIKHsbkunkR
         ixlegs7ebJJ4iSksM0EYEmSRKCP8SzceMybsZDxOqNzgMRvWefND7wDZ5UDrlJDK5k9A
         ddVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+E3gK5dm/rYnd+y/sf22wCsQKbTlHvefYe75S2vcxww90usGf7ZzU0iY+Q2O+pw3VhX7zKhg=@lists.infradead.org
X-Gm-Message-State: AFuF++n15J3UZSlZnxXs5Zl9Ku14aTHlH8+4M1EC1y2EwNvWVogY8g4r
	LcJeoj5bfjyiK9ub1kU9EAK2SLfEb5csq46t+C5TVNKFyjfbb0CqgHF7MHHsM+lomusOLn8MJ2t
	hjn5ICurBZn/iaex6neKnKfeL3A90LIJe5KtQgkYmhOK0UuM0qRYXiGUfA4B1HeiM
X-Gm-Gg: AYBFou3EU7aUU2DKT+4fkqNMyAZT503QYQGBiYdntp50c6pVKzTfbBba2AkqNfdf7Du
	7RPIPD3ZX8EMFq54RMTBUyRyw6SteSz5neC7xnNwPAIBaU0Xr9ZThXP9EHlMb69gXTt9qt12IjT
	CilLLEWfZDjnXw64nKHYUfubJlXK5V045tSyWVW337wU2MZzAvBtgXFTcgmLKC/D9Zu9/0SLE71
	NpiTUjuW5zIPP24zTMZVTiGxLnZgvtv+EYoQDIxu2IinFmd/+fv4cI1GLBcaKGNoAt5KcLaDS0j
	y7LerKgrpZEVV1lT02PiPoapNteOaCev2AmzE7XYvTX+PAcDKT5ZH2GB1tmvAM3pWb0E/yMmOmN
	fh4qPgco2R9R7zq8nltHjtSSog9ZGsPzRj0mM6iLmGASUpcN8UZGBLYU=
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr400198a91.29.1788976659315;
        Wed, 09 Sep 2026 10:57:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr400154a91.29.1788976658756;
        Wed, 09 Sep 2026 10:57:38 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Miles Hu <milehu@codeaurora.org>,
        Rajkumar Manoharan <rmanohar@codeaurora.org>,
        John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org, Sven Eckelmann <sven@narfation.org>
In-Reply-To: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
References: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
Subject: Re: [PATCH] ath11k: modify null check logic in
 ath11k_ce_rx_post_pipe()
Message-Id: <178897665757.2048605.16667073298414981118.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:37 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa19e14 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Bg9AkRiC3xk1yIgQLLAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cOHefjsEsArSNw2yN4uV1m77YN1mpp3s
X-Proofpoint-GUID: cOHefjsEsArSNw2yN4uV1m77YN1mpp3s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX/C7qNqX33TDR
 W6yd0D7ge79d2VpcN7ritxgqsUeEkEeiJ36gRdgZfcs2Li6STmsHUiIhjttfAXKI1uf8cs1N/4d
 fYsR6uRlosnkenANvaSnxb9NaRwWNyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX3hJNsKBKWR7g
 3WZsUmHROMVJ9bUmko6HSW1tFhU2Yd6TS1VbuLH+D1o9JCZ3WHrwLrEE8utLYc84NAJscaG6hJj
 cAvFXdvUxoGt5rk9qWbJTZuHddT4nifpE0uAVtMRRmqAECc1AjjOn/RFQjbq+o9vtRLLw5s7mOQ
 EYfxvXUGKle52BPgFYtP5Xhv9ETUzfdfx8jfOsVqwGVO1NNwghPV7MY1zcOsCCkTXHFs7p3kVK7
 /QvXnHK6DjLXpxZKVHwwZxAWXvFFoA6dobAeKouNYsYf6zxIpeT0rxnaDoehKyosF/zQZtCOD2z
 NXclaR83Bdp9wNM/vojRaoMISMMk8boU+ucGXHj339HMYG8Vnpt80yWtLcd3L/Bvk/R1REfJ1l/
 5eiHDDiySywBEvC6Q4gV64YOW1SAzPV1EU7t5oRFEQ3XEZRy6jMvwLq83dHir0RhrPODwWKRyaK
 6Gr92JRBgKClKJpqV4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105740_577482_07CC51F2 
X-CRM114-Status: GOOD (  10.39  )
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


On Mon, 09 Sep 2024 11:08:20 -0400, Mikhail Lobanov wrote:
> The previous logic in ath11k_ce_rx_post_pipe() incorrectly required both
> dest_ring and status_ring to be NULL in order to exit the function.
> This caused the function to continue even if only one of the pointers
> was NULL, potentially leading to null pointer dereferences in
> ath11k_ce_rx_buf_enqueue_pipe().
> 
> Fix the condition by modifying the logic so that the function returns
> early if either dest_ring or status_ring is NULL.
> 
> [...]

Applied, thanks!

[1/1] ath11k: modify null check logic in ath11k_ce_rx_post_pipe()
      commit: 52953d149ab4da0432d54b09f3c8add42b4d4a82

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


