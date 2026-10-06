Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CA4CA6001
	for <ath11k@archiver.kernel.org>; Tue,  6 Oct 2026 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=; b=l1TxRChDGhv/qPM7Z1qQnPv4IS
	BkbGAwQFyOfmfWAU+Rdi/s1tm/LqZbWAsTOLXj/tYpkxcxeag0sRSByqU7001nfueHWvcjJbjJEvu
	hCCeX2qBhn+8TNSSmYUmw8pxtXbTr8ipQBCrhqlFXM26Xb7vuN8qMWQ/AtifHshABbMGqLdnFd9kw
	7E+mYueP/Px2D+WOYpadKfOYXWwFI+U+cG4jgvqJGKwrUN0BWUinuOCN3qBURytWBNdOuD2GZKoPb
	p5eb4ZeqJmHBXQm7UqKCRdc35HTibkCpaM0DmmrxBgyYb5d3WTwcT8wBL7H76sCtQuaocx+UTZmc/
	efanPqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5xC-00000000wEA-0tpa;
	Tue, 06 Oct 2026 14:15:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5x7-00000000wD4-0zQA
	for ath11k@lists.infradead.org;
	Tue, 06 Oct 2026 14:15:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696EAwHg1405219
	for <ath11k@lists.infradead.org>; Tue, 6 Oct 2026 14:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9VpjXu4u++QS3E8EyJb2g7
	cB91QeLt7IH+hYNOWUP9A=; b=jXgiq5syPqWR17xoDARptpVKQuXWkUINiWZ72i
	Lze+1gDJRFXKWKPJMktJRwN1R/lIWfOomxkU1w8FcAo4gJOh/jpdJdk64sg0Uvzm
	3J0CeX7Cf6RENPiRCunFFYIfX3ipxUo1pS9fgM/Dff86kW0rpAvIAe1bOrBYkYFw
	NUh4JMBpDlNV6pAM3EF14O0VkOAs5QM1kgOWj5fG44dG9EgdWSUghlsvMAqBbDAF
	3BhenvodscstAiaew/DEfm03CB7XTfY2AyUx20dxrZrVCIcWznzmr7wkbkHFWTYA
	aYAC19u3vvpwXiNXyHS9Ez+51YOoJNlgEZ2z8RsaLXNqsY7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbgyf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 06 Oct 2026 14:15:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8909c593cfcso288546b3a.1
        for <ath11k@lists.infradead.org>; Tue, 06 Oct 2026 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791296131; x=1791900931; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=;
        b=H5BfqlpHozRDSDB2bt5E/ZcbkWcHRAtT6JvxweVf8QrvocgqKDnYErOF6wDChhd/3b
         ziwV/WQ48OQnJTnCmaWnlbX8ssdXxVmyJdFRIEn8c9sSKZQ/Us2784T+khH9iF5OdCB+
         rJdnIqqUMj/7IG4sk6NH4bo46bgdtCYQqrb2aJ8xPBXSvmmrnXyZ7PZlMAjOmurfC55i
         IdM33Tvi270bvtrVXGJQvJTuTG7AXJhCYJZUW6zpPFPnmas626cmby9fwmn+As/zBlYL
         3xdHNPvW+eVLeKRQmunHMoalTo5LFr5yIG8VtcKD+PqB5CRxASKp663leT1VSAKkswXu
         Ns+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296131; x=1791900931;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=;
        b=JfQO4+9uXp1mq1hJ2X3HL+JFvFzisD7Jk4T53gqKCYSvSpryGU9a7ChMf8hQfiHJcj
         N8srXkFERX1l9c1wETTAqpSTB5qVWa4let2Bs26E1sZ9FyJx/zr/jrCZplaML67iCIhm
         BdU+Aj6aZcqKY75LS+EP6uBb55f8YeXcrmk2FWGlc26T9HQmMqiAirNXX0yt4bmsg/8E
         E51BwWjV9TRPbub6U+Vq7BdeTmO6xNFo7GiA7bzAkNGqfgXdr20/Q8R4eND5sTQnGBq6
         Umtook4dtHrOJy3P7oy56w5GF0beaLS1Ra8OugDqmbKE+UCAto2Bm5TxBfzJG3E5Agcd
         4f0g==
X-Forwarded-Encrypted: i=1; AKwUvBzLZDY2O1inzPID24+yiKOcTOQCqqCBc2w+Kw3IuKNBd8BCaw/ui41ukIvptC3tKyy2P3mhgtQ=@lists.infradead.org
X-Gm-Message-State: AFuF++kdjvOY4VhiyETKKU0G+vRXhqoA4Ts8ZNk6bRRVcsXFq4Ejt7+8
	0WB5WIVY8N7IPZ/36rhuZ9/sTymWhnUmurfxpRu8rMr8PIfNzOEPeztGjkGF62orabMYp9Rbioz
	We4zqlIFlHOGdTHWHbVt6usNVZLgYhPP5bIJpI4MdZv9qXy8UIZiCYtq41xE2mvIn
X-Gm-Gg: AYBFou2KrGYiOARri3EpHB3LeRZpOFAsnfiOUrTwhlDxsxswCvZIpzIw4bsZazqIvJU
	Uqf6bwQHGQEzYqi3rviBnCNjmmUFSDjpctfhFQtFlAEWJXYy+3wb18fsFYP+1ujSnI3VWADnOK/
	+I0ekOZs3ac/KdoQZnAQaMJLL6eoB0Ka01zz74lNdP1sg5Nrv5oNxvjoK6TGnFl2t/htBwEQi9D
	5+YDKd+wst050XM09BZo0U6kF0sk3m0qkwl8y0DzXG+9w845IVM0gV9gcI4XI1HpL8nZSbvuzMf
	O5WF7FTUSCGulX6flWtAH+06YZ4bdOXGxVnW6RYbOxduzJHtAquIsvlV5aBRUe3NobTotKIF4L3
	DI9/PQrY+tSdAcbzV4chlHZyMCX8sdkvTJXBb
X-Received: by 2002:a05:6a00:c50f:b0:891:3e34:e07e with SMTP id d2e1a72fcca58-8913e34e55bmr360942b3a.34.1791296131180;
        Tue, 06 Oct 2026 07:15:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:c50f:b0:891:3e34:e07e with SMTP id d2e1a72fcca58-8913e34e55bmr360919b3a.34.1791296130606;
        Tue, 06 Oct 2026 07:15:30 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c1b1dfbsm5131184b3a.26.2026.10.06.07.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 07:15:30 -0700 (PDT)
Message-ID: <dfb5d597-f2cd-4ce1-8eac-2c2b74dc25f7@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 07:15:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20261006
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac50284 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=6eATFoqnGXLanKaFIDIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: cgDEPCKqZAkccKrE4_vb0QiKIC-Y76Q2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1NiBTYWx0ZWRfX//VdeLrmHqfk
 ah67u1L3Ydv5Moe9c/RIVfW9WpLFfudokWKP2d9C1I3q2Zk7mjD6oPXqo0sPT3eLMMYkOJcZoth
 PCquBPYCzEjb8KsczcYWxhw7yr9JTRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1NiBTYWx0ZWRfX74fI7LuyKEm6
 6CkP2PMT90ElpAaJK3sbIvFWoBpAojbD5QbWR6ODz4uTOuXLxwTRKlCkvUf7lBA7Y7gFOJrEyhU
 5wCfzmq+hi+hRUFqOXAWTJkXQSSrrq0iMSQnY2uqGLUEvqSMd7QY7XLtec3Zk5q8ryG8xC5Qxy+
 wnX747CasJm8Dz1NGpb2N28hCFmQsERTC69GJBN+n8alBsTdGZhbWhxTQsBWsLgGsCfcEs1AGP+
 GLSzwua+v+T6R7ufWgiuHpoHsctBrZvoF68MgTQ6QvhjXTGd0TFNA4pgwlba5cfXQR5pC1HeiM9
 0WZW/MoKTPxpAB0pf+2G2xqaa3acvtM3MFzWDVEDPx1X+mE6ut/wgpc5otDvPfskTXoP/JOxGVe
 v0D/LsQexx4BPXw3JLQQaofdFYtbMthAQuh54ukuhN6qtARGeWLIGabXuoWNr1c+OfbZdoqhTnq
 ORfYmCps5gF455cf5QQ==
X-Proofpoint-ORIG-GUID: cgDEPCKqZAkccKrE4_vb0QiKIC-Y76Q2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_071533_929517_BF09EAFB 
X-CRM114-Status: UNSURE (   7.86  )
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

The following changes since commit d24e8ac715de2e16a53c144005b1863660a5fbea:

  Merge tag 'net-7.3-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-10-01 06:41:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261006

for you to fetch changes up to 05165f7b3b9ab6817fe216c24f90755b7c5e15f3:

  Revert "wifi: ath12k: add panic handler" (2026-10-06 06:42:17 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc7

In ath12k, revert the panic handler that landed in v6.11 since it can
perform a voluntary context switch within an RCU read-side critical
section.

----------------------------------------------------------------
Yingying Tang (1):
      Revert "wifi: ath12k: add panic handler"

 drivers/net/wireless/ath/ath12k/core.c | 33 +--------------------------------
 drivers/net/wireless/ath/ath12k/core.h |  3 ---
 drivers/net/wireless/ath/ath12k/hif.h  |  9 ---------
 drivers/net/wireless/ath/ath12k/pci.c  |  8 --------
 4 files changed, 1 insertion(+), 52 deletions(-)

