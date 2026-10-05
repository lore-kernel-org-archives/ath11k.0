Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B8ACA5FFE
	for <ath11k@archiver.kernel.org>; Mon,  5 Oct 2026 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UM8vKsYqKY/wxwyZHCLaCwEcwikM4wfFgIbAvvc2gqc=; b=nJrmq776rMiP7BcLxpbroH9cAS
	ZWxXjPPPyttboA+L71ADpX5Us4XBU/2zUjGffBlYNrdmoX2BCvcZs/EZCQWGDWLXXSuu3pIa7MLXy
	XpoE21mDK7GIisbvu7R18WF1mrg03jLiAwkW2Cny8Jj5PiBGd0eMKM9mP0WIG2IiS6kULp2mDLMGY
	z/0uqKrj+Dz1tzMol39d6qo3EfDiv75dBLwPRR2H8eNGBiHTIWv8+9Udwt2eOvUKIyaIfT+25aB+y
	YWrQfmG4qNskiHmzWlpMtVj30/GxPfkML5jm7svw2TBvr+RQ4A0ChBuKipcYWmLH4myVZ8m1S5xFx
	SqBOssDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkK7-0000000GjRX-3rbp;
	Mon, 05 Oct 2026 15:09:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkK5-0000000GjQD-2CXH
	for ath11k@lists.infradead.org;
	Mon, 05 Oct 2026 15:09:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP7Ia2214892
	for <ath11k@lists.infradead.org>; Mon, 5 Oct 2026 15:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UM8vKsYqKY/wxwyZHCLaCwEcwikM4wfFgIbAvvc2gqc=; b=p4CTEhhwfSlDneDZ
	ZZY+iofFHKMWy0sj+CNKSLzOVsYQY7c3Vron0txDlT5Vm5JUTbRkXoUS04ndsywE
	KVj0KXLWYOoaq+lWGkJFXf+89USyurqYelHgRxTMPcpXYBIvWbtyDHK455GbEv7Q
	ADPKkVMvVMOZCZWj5rFeTcvfttiMP6U4RKPydAanST93FeCXL4VkjvQSfB7VdUXZ
	2VY9/MQ+NXP+6T0Ag60wn8cxxN1P6uX/ihhkF5gCveGzmMlE+b9Gn138Zhdo1j2Y
	gSWNGo9LQbxdo+7zT0A5MR2hYwAt2DJ7X4vDQy4abTYIjAMfK/4/Q+5daFaM1cVR
	0dYjjQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyts86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 05 Oct 2026 15:09:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2d4a8623bso16471685ad.1
        for <ath11k@lists.infradead.org>; Mon, 05 Oct 2026 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212988; x=1791817788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM8vKsYqKY/wxwyZHCLaCwEcwikM4wfFgIbAvvc2gqc=;
        b=ghFM/6q/CkbiHbYomhi0qov0nZ8MrT5yXCI5p1F24QroG+4yLbRqmLFszzLBuYYctx
         nN5jHHkSiy7LRZX6TILMZ3TBu+iRx7Rmvq9l/j0vIv08TQCAwqkg1Z8GBezJhg/NJik9
         AupmjTwm7R5WKtej64CaEjEA+PR8gySPurNIMqKGE7NhFkDDbf9nUwEYxYwFHweeau5G
         QtGE5VFzCwY6IjRo8xvj7Snm/WnnuNBT2ugs/eTtyQV0im+o/wHDTdcBK+cNQZv46dOS
         sx39KEjktNNUL2vNIzD+LsQtB0PTflQ/BXpZjKacytya9xkqo2Fz55+JZ65kWDZVtVtM
         DOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212988; x=1791817788;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM8vKsYqKY/wxwyZHCLaCwEcwikM4wfFgIbAvvc2gqc=;
        b=LRh6y+HlputN9V4NIgs9LcRjn3IMXGf49SgB2vZi6mjRWhiczkxJBDsOD2EvG6huZB
         Vi4ToOjciyh3Lh1HQ3md/98LRkc5jKIp9f42pXiHegUo/i2qVh+RejjuSHBbCT7R3/Yn
         mqM51jeXWmO+oCgaT1h1G+WJfHgfm8r9c8gbTBH2Adof2Kp40H88OJgr03E6F7/BQ58h
         OCmu3KF/cIKAFPGA+qECba+ERbNHZvEoedCzIquchwjKRHJ0dseZ2T9JHWHsGSuno0uz
         v8RIdYhXf1qwCEV9IGYme0RSnNzsPGRM1qk0NwPPtXhxaZduSYdIUMWngdDBZjwT+9zM
         nZ+Q==
X-Forwarded-Encrypted: i=1; AKwUvByYrJboHHkdOps1r/Yy0u7ttdhOx9zKUBdICS43Vy0Mw+kzF2fW8P4IgXE5rddccU42KDIzrcA=@lists.infradead.org
X-Gm-Message-State: AFq9FYKVCO7BUSDT0pF+nGRJHaIwntuEXRRbLJjNB+2iovMFlPlTVSUv
	VlwGSQbEqWY377SxJ2EDy+dKNK9ryQpxQ72TvI9b8C5JpcUDAyr168NiDi/gaGEaOaPZumUtlaX
	dRWBf4EqcdMMiN7r4VdccpDJg1O1OFBn8uN7nMzRzKSotFMc2zBwLaZ9jlLG1DyKAsCZ4s1z7
X-Gm-Gg: AYBFou2WNKwGmowU74TMiK27owTgHXf9/hwlkEfmvBfi2E48mkFQfkek3rwQYHwULor
	4fWzrXjQuPkteA4iIJfkZmsRA0EgpuaHd0CTFVuDnCowthaFWCSCXbzNePLrh1IKRMHCQJuQG6j
	3HvfhfLg9C4/i4DQuBear9c4B4V3qxBNM1qZ4TG6ui22r+saN9W7LxdTefUU3SZZjevbbmHzKie
	7XtlaohwU5eFBuu0yPNoubMYxebipw7R4fZ4NBLfzOVdVW9RR9LXafXXwZ2aY2WR1vkPNGmuHPf
	bV+LU4gwJ5+KMkDy2wCK6JYtV0W92KQD8G1g4Ys6+pKfAnHnRg/BTDr2+FfCtrDCkjUOEUkR0e6
	pXPp8IBlacqDX93BEMbJg2cW0CObEgUlMHWMWLchu7jfjJIcl5jAJdT8=
X-Received: by 2002:a17:902:d548:b0:2e4:bfcb:2788 with SMTP id d9443c01a7336-2e4bfcb3bbemr78035715ad.72.1791212988322;
        Mon, 05 Oct 2026 08:09:48 -0700 (PDT)
X-Received: by 2002:a17:902:d548:b0:2e4:bfcb:2788 with SMTP id d9443c01a7336-2e4bfcb3bbemr78035265ad.72.1791212987726;
        Mon, 05 Oct 2026 08:09:47 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1bfsm9130075ad.28.2026.10.05.08.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:46 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20260928-ath11k-unbalanced-irq-enable-disable-v1-1-75166f534763@oss.qualcomm.com>
References: <20260928-ath11k-unbalanced-irq-enable-disable-v1-1-75166f534763@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath11k: fix unbalanced IRQ
 enable/disable during suspend/resume
Message-Id: <179121298614.2358654.4522764311358973732.b4-ty@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 08:09:46 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: FRV0WuhTeN79eeMY7rcXchUjnQHHJdth
X-Proofpoint-ORIG-GUID: FRV0WuhTeN79eeMY7rcXchUjnQHHJdth
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3bdbd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Tf6FFpAjyP9XlBvCETIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX3VSH8Ijs05Yv
 pTX+Je3AM32RI/wtaf9chVI/O0SO8BNQ3zlXTPVM2RLcaR6b7AuNsGppT3P/LUE4t4JHSV3hgcA
 BP2CuvwLQMKAYrntCqWVFl93RpuqnOGxdO1DUDvx2NgDo7gTb3WpjRaLABByMgn2XUiupB1P1wu
 AQgLUb8d+p7Fo4ADk4EujV93WjFPbzdPDQj6l7U4a+BDlwc+tIcW1hixe2RX/IRVhUr9RPckYjI
 LaMHcltntpHCfZQmKVKVu8TktaYjD9aFXwU1XELi/JhB7At2Tvp+DlYD4yrBTQjab/Ni9V5jxa/
 IV+L24BGTSJx7YGiastZzzR8QqVuFhjdp/meuAs0mPF3sbGe+/b/5KF6UqMNxtXM3YfokEd7KJf
 6OsvWlbn69Ha3Fim3ml28Ti2zpMgJUdjXx4ZTzRuPQqjk2WYS967qBzh6zoJH6oUZacTDsLP2Tl
 2aS8FFR820ZebnjKauw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX+tfRfN/X6uBC
 3KRdCG/9yCYX2q/cKU1o5HBRHh8MOcgnsyjIdKnVl8yJXTSfAmarSR1rVPTeldsAWTnjuYioL/H
 sc5W2AWJt1FoPqlKMWr5HcEAljFhsNQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_080949_767754_A101E361 
X-CRM114-Status: UNSURE (   8.03  )
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


On Mon, 28 Sep 2026 18:45:25 +0800, Baochen Qiang wrote:
> Commit f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware
> crash recovery") added an unconditional ath11k_hif_irq_disable()/
> ath11k_hif_ce_irq_disable() pair inside
> ath11k_core_reconfigure_on_crash(), guarded by "if (!ab->is_reset)", to
> stop the DP NAPI from touching rings that have just been torn down. That
> fixes AHB device recovery, but breaks PCI device suspend/resume. During
> suspend, IRQs are disabled once in ath11k_core_suspend_late(). Then during
> resume, ath11k_core_reconfigure_on_crash() sees ab->is_reset clear and
> disables them a second time. Those IRQs are enabled only once during
> the following reinitialization, leaving the IRQ lines masked. As a result,
> HTC control responses never arrive, and resume fails:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume
      commit: e56c9d429ba004d5416b03091fd7656187cdcaf1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


