Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C04C433EF
	for <ath11k@archiver.kernel.org>; Sat,  7 May 2022 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zDZ1Tunf2irOHBLRlPsEEvY8OHqKqQ9pqEqkYDmJ2oQ=; b=n/d+fh1LloV4ss
	PvusRlJiCOEvYZnG5t/nRtNr8lokwFtExUbF4p5m8/MOStVHay1LfwRUMzq21pKf4e9Ntl/gdSJSz
	P6ySLJOesUT42n9OO+PODwKbNDs+gV9UqKHFyV/ww2YV9g07UTwRCvepByDcNf7kZ7k+E7d2NdK4/
	GYuvS+WSfSEYSuFW2HXV3hhL46uMSdwImayOlGaQI761yAZlXgfsqbu1bE4Uip4tHryIzK//F/HH5
	PA77iAvPR0+N/noVdwVxolswrdrqhwAb+ZHitLlv4o39Ee44/5Zya23iLasyS4Fvv7TaNBRpS3t0J
	qV/xW6+q7/BoL+FxYI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnFz6-006WFP-DI; Sat, 07 May 2022 08:40:16 +0000
Received: from mr85p00im-ztdg06021801.me.com ([17.58.23.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnFz3-006WEM-Vh
 for ath11k@lists.infradead.org; Sat, 07 May 2022 08:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1651912811;
 bh=xqYBtVOpriWPTOMmegexu4BXTutKcEgwEpcmGK1OzhA=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=QXM4fA7ls2fP5LidhXW4eoxEO2BdW9+JObY9oyLgQ76Ik6rePQCQiKkl85hTMJljE
 z/8ml2J/UGY6ZlMHJ05+uGbNJ1MBxzLHbipHZUi/e1mpSgvKHv+dXTExZWTLdv7ozg
 asZFOmusCWI6emPyqxthH/DV1keY1ZrXPYfFg2LHBVVbAKiTI2wUTPRL4YiNqNJUn2
 vBxwjIaHvhkywziKDVs/75owWggtgDly2cVUErztAZR7r7Yh12WMHfp6GlqWVJDjw5
 AXPXrmJMaCzdtKKW9YH10eixi4pD4WoweXGlUD3lp3IqPcjEVmgQyXJFbwhStCTsLm
 iDBkCLVa7Zdhg==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021801.me.com (Postfix) with ESMTPSA id DF14FD00879
 for <ath11k@lists.infradead.org>; Sat,  7 May 2022 08:40:10 +0000 (UTC)
From: =?utf-8?Q?Tomasz_Kl=C4=99k?= <tklek@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1 RAM ISSUES
Message-Id: <FC5D84C4-E94C-4037-8EA7-277695030A49@icloud.com>
Date: Sat, 7 May 2022 10:40:07 +0200
To: ath11k@lists.infradead.org
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Proofpoint-GUID: QAFUNYWdlCZO1UCgWcKHKiNBqLhE6Viv
X-Proofpoint-ORIG-GUID: QAFUNYWdlCZO1UCgWcKHKiNBqLhE6Viv
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 clxscore=1011 adultscore=0 mlxlogscore=575 phishscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_014014_065291_F0BB0033 
X-CRM114-Status: UNSURE (   3.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi, can I use WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1 driver with 256mb of RAM on my router?

Best regards,
TK.
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
