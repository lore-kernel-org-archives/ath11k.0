Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0C1C5620A
	for <ath11k@archiver.kernel.org>; Thu,  6 Aug 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CFZb/EO3hyAZkE/aWu6orRYoFmRNJ2f+xhNAveYlT4=; b=4hegOG3XaCTRrsZsUNIUCRQKNo
	CMdz2WpPNBcI2sQKFAf66vr2uEfhoPlcTKRsA5bzAqoOxNoSb07JdJ+Yy+L92E4auAtXKE/uY5EoD
	6M1/qvAKg+cu3BnfGN6pp0lAzPqx2A1fCJQR9+csNywAa5GIsWSLTVVMcswh3KeljjakKtzTajcQK
	VssWb0nfzEwSSvHqdCoLRnysZ/covebKw/Zpg0SkeNOm/CirTCmtKuVaKgJpWjLyqG+PNgbhiU8HX
	OBE6J4jTPEBLCRQYkdbdEMNeI2uwvlNm5mhbJ8AE2poK22gMVY3JOOjtLlDwQQl4vOu0gcWocWTRw
	79+xF18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv6g-00000005Wg2-11wC;
	Thu, 06 Aug 2026 10:13:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv6e-00000005Wei-2cT5
	for ath11k@lists.infradead.org;
	Thu, 06 Aug 2026 10:13:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neD81625694
	for <ath11k@lists.infradead.org>; Thu, 6 Aug 2026 10:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5CFZb/EO3hy
	AZkE/aWu6orRYoFmRNJ2f+xhNAveYlT4=; b=hZ8zuT9TI//cOk3sgWzIrlylREx
	U9MNVsyb37aXVsQLvI6rp7D+mydZGzh9yizY6t8ndN6NWdGgOpwPJmJ1ZxmHiY3N
	GjehpJyVojbHQQF8n403Q5o+SWtDcoZ89r+cuos+lD/RqZ1InWDP7n0ANpX4pUBl
	oP+m9AdchihdRXGHfw5ufyTO3tAX0BCGuFeQm+Ni41BDyNjBB4m21jWxIvdPDEtT
	HLbPBabkKt5RAj1guxB3w/7rX2wVvsvZeI9RMXO43gFxb+fQumeoZgXg6lhIleE4
	AtEtPWAVbnFkCTRZWK4MTHcD8id6YpT85cqmaIulbLh3vx86/a6QadLOH5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntngpyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 10:13:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so4445147a91.2
        for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011223; x=1786616023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CFZb/EO3hyAZkE/aWu6orRYoFmRNJ2f+xhNAveYlT4=;
        b=gpEAoIT2hG7Z4QE46deo15PFgW0kT0EKKGcDcDKL0rWMkKDP627s+1aCmuToqQHeRs
         Mki6VKGNKJINBLiTIsiFQOCxB6JHXmopIG22BqY1XbASC3/OJzC7o4+5+nR8A1s2KB53
         2Y99IKCLTN5RPqJ7MKBsxcoxpcYprz4wna9QyOfj4rZPUgiVrGeH+05R7Ti+mXNeQZ45
         YvTw33E7xK/FIsKC4WyDTHgajWrMSnRe6maAtKmm0VbtULqDCh+J6nfamXBkA5bpQhYu
         lsbCvvy0PAGiwg43Bn1jecD/q6A0eixuYBZ5dB4NGi1rkYWo185/ZuZRdFW80AmEM65l
         0wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011223; x=1786616023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CFZb/EO3hyAZkE/aWu6orRYoFmRNJ2f+xhNAveYlT4=;
        b=cW3bRELmiUwYQ+4yDPbfOg7lAbB1EqALVarG9Db9IubgoeaIcJfYnTmCh3VfBcLS8D
         3N8k2abFFDOnVU6PJhRCDskV3l+gK2nQRgJHoqGUxPNVhlImFTz2TrvTYjZYWiN0TZd6
         T+BG44Vapvmux8pqNoj7Osa9qGNBrR99v46Udd4ES95DypXdCngCJ+Eg/rX3hcbgO7nh
         QnlsVAAEjdPDMrjdaB/LVIIKTKdXHfzrOV34wQsZe3gNmaYit2cRBHyIFNSSv3cj6eRm
         4w0QTIHQundrLZyq4dwlQc374EgxVEaJruzwOB5+keZyRsBJmcWrEIWGJ9ncoMyeHGjL
         d1Zg==
X-Gm-Message-State: AOJu0YxLjiIy4YsTDfmkqC2ge6UHJ0SWFbvS+jWOKzKn/ht9AbZ6Jb3a
	BJu79TaDardsbSVOkSrLF4qLcZ9zxWQ4tJPtmgWn2h8zsoNiB4F+rzhIGnB5B2Aoq21j8I7zByE
	L8d/TdVTDiADWmKpFLGmvWgStL6y1Ut7R0mgPqmWAEjQloljHI3rGiETAmMsDlwS/
X-Gm-Gg: AR+sD10UqM5+pi4HyxqaGdZwcQmDio1E4j8RovN5Y8KTtorcP2n6TvK0RWy04mkg4uc
	DYJAmInnIVaeOEHSpxeTToVpTHTXITzCwMUXpfLflcyPbexqkzNu85Ds3RwU6jMhnpMnZ5I1No4
	D+Nx0H2QRk3S5S3c9BAwi5oG4oWTlvJh1AyiAHF4S8XsNejhKow8GJV7NLkR/wsfgdtU5aKUaQv
	st1RkSEEuwOAmezx2khWJV8C9JSnAhwAMNvxKJ5SyftDDvxQmew2oC3Mw0gglwvgCQGJ53l2J5U
	7ZSH44NkGfMI3MCJy9eMSCUKSpiE/ADJthP8nhkX1OpcO8AH8uNKyZBhjMFWPB6obm+zUVqVZuL
	FHJhloUZ/uZlkrdwT+YEIOFJaXxfL4/QGgCy0ehc+R5yzal8e2oCRULVmLcA=
X-Received: by 2002:a17:90a:c107:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-3903c53783cmr15514455a91.5.1786011223638;
        Thu, 06 Aug 2026 03:13:43 -0700 (PDT)
X-Received: by 2002:a17:90a:c107:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-3903c53783cmr15514389a91.5.1786011223163;
        Thu, 06 Aug 2026 03:13:43 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm1257090a91.3.2026.08.06.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:13:42 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current v2 3/3] wifi: ath11k: unregister PM notifier on QMI init failure path
Date: Thu,  6 Aug 2026 18:13:31 +0800
Message-Id: <20260806101331.484063-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
References: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX1mbsiNC9JBXC
 spVp+5uaWc3/etr0276pNx71qsPxbAR+ge1dGG0yfSkvdZBOB9I5M3JAjyDR9SOMgzC0+kW1cst
 b2HTpTFp/YVzta0EayNZ1jRUSUzwktL/R6YYwos1/ELG2P5QG7U8RQFSVslqQ2FFza0HcxuoT55
 sXoaVpv3z919OOWc/UvsDlVJEAV/i3tm3l12WFC81weK/Hw2sgk9uPjXP1yQQCLI+7PYKqf08dB
 5YvFOEInXwkbLE+yhxbJiTKgw/q6ShPlXiQg5Zw/tb1M4D+pVG5r4VhrCC5itIL7fHXvj0ji5gA
 h5nGE03uDduE35a+gbB0uZsjDaKFfJgcG20i3LjmGojS5kDiIvOgTuyYjBwdF3E8SOhPYt/45sJ
 P5Poc5zQAKLYgKBvEmlDd1u8cBeJyDwAanVt0scF9s8+hC8VYX+X5RUp7rGplgCuRHw4dU7vV/N
 gVzQijmQ8E9578QVWgQ==
X-Proofpoint-ORIG-GUID: z9SknnUMsc9-GucRkZR6aCwh1y5etk4G
X-Proofpoint-GUID: z9SknnUMsc9-GucRkZR6aCwh1y5etk4G
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a745e58 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FJAr2BPrIL5JYYbaf3kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX2PDio/MT2BTt
 J8vPc7J7Nv7jS1zaWAkRmwq6lPersuHmKifwO4EHyzXjxctZ6QysHBVhnjU6TtAOmzCpKAP9cQ9
 q15O5ycKrdBIKDdPBKvIBE/SQawi1cs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_031344_672200_F793F324 
X-CRM114-Status: GOOD (  11.20  )
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

ath11k_core_init() registers a PM notifier before the QMI server
becomes available. If the QMI server never arrives, the device remove()
path can take the early-exit path introduced for QMI initialization
failures, skipping ath11k_core_deinit().

As a result, the PM notifier remains registered after the ath11k base
object has been freed. A subsequent suspend or resume event may invoke
the stale notifier and trigger a use-after-free.

Fix this by explicitly unregistering the PM notifier in the QMI failure
cleanup path before releasing ath11k resources.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index c3ce5ea36e3c..ee3f493d2e44 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1302,6 +1302,7 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
 		ath11k_ahb_power_down(ab, false);
 		ath11k_debugfs_soc_destroy(ab);
 		ath11k_qmi_deinit_service(ab);
+		ath11k_core_pm_notifier_unregister(ab);
 		goto qmi_fail;
 	}
 
-- 
2.34.1


