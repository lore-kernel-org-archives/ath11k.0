Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A17C606A31A
	for <ath11k@archiver.kernel.org>; Thu, 22 Oct 2026 17:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ertaw+h/;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jBxbkPjm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=am3lgEmc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=; b=ertaw+h/Vha7y6AF7eW4R6Vz6D
	TgJwDS+5UAzHAjgCxXnelTnW8OwdtqJ06Gpsym3T0p5JWuh+oyIeZcDOBT+wlaRZzInO5MYX4A5pK
	ZDBRUIlKE7xgAECQ8XKejT2LWBZJN0rfkKqUy6Izp8AF49XtlGMvRSdcCwYTJ08zrCSm19NCMCbNG
	QRXb42e/dehMcCGlhkSUg2tnTb04dTH5ZI4K72PfP8hlhoy+ZSDmnJ+waCv65MWJiqqKNY54MTziB
	RsazNpREIG4tgaSa/UkD9YQdSYTiEqI2mW95I1A5J/8wqSmOP3mblT49N+welzvT+1sFKfolz66Ln
	AFd+/Rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwvp-0000000Edss-3NPQ;
	Thu, 22 Oct 2026 17:50:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwvl-0000000Edqh-2BQV
	for ath11k@lists.infradead.org;
	Thu, 22 Oct 2026 17:50:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MG5Pm2618717
	for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 17:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gugNWHoGVfRUDNY8Vu+7gr
	h/eYK/jhHtdCQenYRhq5A=; b=jBxbkPjmSWBgZFfe9z5p4TTSrX7oxGJ8YxEtpx
	U3+FwdYuMh/PmrSH9Plo6+C+IUDdbJJTIeHlCcxc+U+XSk86ggHymLs5oKbyModJ
	yMikKvui/bkVVD9NNBWiozG7Hjn3yXPiUCUXIR3/HdUe7Ne+P2MvB43+79+UaFDL
	FA8CT1g5GPy/ofhuM3J23uY1k8tBVnB6TO3eAuPh/RQcV0JDPkAtXKgHAJhazYg4
	EEO0AD6Wtjt0g2db3ePVHiVY+GT+PwplxrTwZuGWUozikth5H142Av1KGPgf7mW2
	6vzqwj1dq7SJSwdcGG2fo8+LQt6M/ul0Y45UQZNie8dKyVSw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0gf7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 17:50:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151ba226e1bso31062c88.0
        for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792691419; x=1793296219; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=;
        b=am3lgEmcinGGtApeob89PDtcWukI6/HJXfEMtOl875of06QpE01dHRy0xj6JhbOamH
         knoSqyWNieQvuWCeZZsZrpNPb31nL2Tm9UViFgC2O8S8ZsWZEPvPRjynAUd4NoiUZDHI
         XuFb6ajQ5Dvrk7/sQVwyDPgFkrCGNAbxAq7+c/KededU8H4hpdsowOZ5O7MMsjzG7ML7
         +oBYl7OMa4Qp8xCxiMBDJsU26qyEHAsvSmY8B6PJkhlKLfAYCrb0KV41/8jkACz8UEIG
         EcQYP2UEIN3Ve69O+o8/vkXHQCqOWaZ9H/IEnsEDfipKyUIPcUJmulqu45lO3xaU8pt+
         /FnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691419; x=1793296219;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=;
        b=OWVqNk2kgayiWjgw2slzYrA9/2iqnJAOIofXJriXbACdvCwJ4O1xTRBT18FDVNnrAO
         CScvHmtP/fVkuvRnYfhjWWDvRvFxz2ywuOhCZ1cU65+Hja+TOSLiSVGba/Rlkngwox18
         tvZ9GAt9Qsdy8fb97//XJ9DdwMOHQzd/ro/yzP98T9oWdUbTmdQhBSxKuGXRZ7nU61pX
         imMsJX6rFoZN2QE0pHUyysEHxhNJGpZCrB2Gu5bz3h42XfXSdtd4Pu3TiUzUxpNmGxPF
         Mw/qQuCqtWddzK/9eq/EY5yj9O/4t4nytuetNFnB0h0Ep04J/ITuK3mnt68c2V2wmkQB
         ZfUA==
X-Forwarded-Encrypted: i=1; AKwUvBxaEkUasOD+9ZuZ5tpORznVKA7qkeiacm8K1MKPFIFk0GWn2UUoao1NtrF165kfkTHbEpOZ1YY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKz7121DvWRt4jvzBtASKFKg2X74iVbyyAw1jisfWbov50wISvh
	l7vAi/IYaXIXirS2IiG09A3WKpzEfa7nQEiTJqrKrHEd4Pb0hjBeARgiEz3BiHJtcnutPL5nAvG
	MaTiunPMgTT9YN+PrYR+hhoIswlIkETWQndGYTHIUD6FmwndTQi2mQjbfXsQp+s1i
X-Gm-Gg: AYBFou3ibEmNlZM5m9VkxkiyLrk2ljjUG9sGn4wvin4Bs+cq0Fn11n6RRfoJsGlN6a8
	NT3emJvC7VBBep+InTbFAGnt9fxqJc/nW6b6JrwHuKfBPC/1f3OX5GYQvLrSsQPaFqYjdoBmM0V
	brRzAVB4bc6TPH+yR5t+pxmVu6OcJ2PDFRYDyBeL8cx4Y0vyE3pcNjDGvvNTFfOIQXo4cG0hz4W
	x+XSIdLN/v4KbDRKDhENtfxDAzNsAc8nKiqkfII/ojPoXVUoOyIuYBJ1ltiWQ4S77ZktYPOJr2r
	wdS+pQJfpOI98KrNN9c2T7Yxqy11ZiTsKermUYR5XdzzlnhomTjUU772tL/jfgXo8iEg5Mc9Gh2
	L5pyR81/ZGHIHEFQUG/3HHtnMyXzNgA1+codt
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr9771920c88.7.1792691418454;
        Thu, 22 Oct 2026 10:50:18 -0700 (PDT)
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr9771872c88.7.1792691417718;
        Thu, 22 Oct 2026 10:50:17 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195a7f440e4sm140975c88.7.2026.10.22.10.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:50:17 -0700 (PDT)
Message-ID: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:50:15 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261022
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HfDXpltZahXVUz5uwoxJCyf-j9DN4B9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX494kUJoiGOje
 ceV5Ket4pBu1h5409yuBmB8sFqZEQ4zV7Y8QLKZOixUHjVUTh2UzHGv/Sk/lJw3VjEliIae9vbA
 XM6GprWZCm1RTweQhljX6cOpNtRYx0h25YFbMFbh5KTTO3PaR4QdwgQf6T8KDacnwhdDC2MAYkH
 I5302Qudv8AXAVbv2UUoE6eMiL63x8sQWeRRjksd8C8VxKkTAH+/qIHIFABeKOLC//+mcHHB58D
 Vy/JKyMJUYJwgyH+C3Y4GgfMsqgfLOgOq2tdwKmhcC7tYqHpXp5/0roEv2FPOeGgF4p1fELLurI
 j/pPDUPunRQMPC23pUHitCUXWyJn3Prb8d7v4MMvdTWpc3qsjirLeCdas6IZN8HzSVHcOgW+kli
 GudJ2PR0eI8o4DdlkbDIhFjfjaTs65PkDGSN5eFCHvlvDS9egVqeUyJXhhr8c2rkYx7nCTPTqHJ
 aeIvXk8wxpqJimTYTMA==
X-Proofpoint-GUID: HfDXpltZahXVUz5uwoxJCyf-j9DN4B9z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX6xLV3H5xUDeI
 LSt+lC0m894S1oaCkjVwUILG5zoC13OdO7NAqETcZ6PZNNRsay9pmJY7xDqLay1w/EFcNZp1wOu
 iGaBvC/FrwZUjBFV6vTLcLzqgnQI34Q=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6ada4cdb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=wC-Lp9yRyfpcNyighFwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_105021_705933_9829E8C5 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's an updated pull request for ath10k, ath11k and ath12k firmware.
This supersedes the request for ath-20261021.

There are no changes for ath11k or ath12k.

For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 00b1df13f9d0adebcb90bd110a4a22de5115e077:

  Merge branch 'main' into 'main' (2026-10-22 09:39:18 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261022

for you to fetch changes up to 72f3b81c89fbc52677b9dbbfa92cde0ae00a36e2:

  ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226 (2026-10-22 10:45:11 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226

 WHENCE                                   |   2 +-
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn | Bin 3811820 -> 3808072 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

