Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D213B109C040
	for <ath11k@archiver.kernel.org>; Wed, 25 Mar 2026 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=; b=XwS+APpY0CKpIurvGDVmVtdLoE
	vIsQOKc0RWTmJtGZcKSQVi+9M9zxBxG7xEPPRHHLQOQXmLQDr9hD1M0A5lK/gv48S0UNlSN1+JOeG
	kZIArx0TcRud1JM9KC9VjQuIyiWUWEabMJeAVJOp/VUwFBq7gPaanDdQIpHL7PRLxof0ZB0DZn+tw
	xWeomnyolnAmZ0Zq7bTArWjxI+mF4Xl4c3VpOwYI9NVJnpttnaBZVn1Bu6H9cLMLyTiENZlptmWmf
	V3IfKfPHRVndCS2tqjTATA7FZ/OXHfcBnRWIsQUFG05ITKJdDOFHedKgZuVbkGrfMLNvTpwjoXWFj
	bAI5R8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SWY-000000041z8-1P6m;
	Wed, 25 Mar 2026 18:00:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SWW-000000041yA-0IUT
	for ath11k@lists.infradead.org;
	Wed, 25 Mar 2026 18:00:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHDUG433667
	for <ath11k@lists.infradead.org>; Wed, 25 Mar 2026 18:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M2igQvo0xuhoDdesLA15tF
	kb4vPga0Hsxbg78nCkoEo=; b=Qbv5X0HbVUZz+vewgHuF9ZN8NA/EpeX/qykEMP
	nf07y7SUKqHGQKCiXfclA2j2MIo4SNlLok57ay7OwRmTa+XB1p2oXh2WyKnpSVxp
	bGvAl9kYl2Ou+U/BgZEk5ZZ0160XEAa2bGL7vsXHEwsV6fCe5v88flhlnUD/1Urt
	qE4cI270bk9H1lPbYuasIVtfS1HdcrT/0wYAWOYpfoP+qrZou3p+h5Q8+oPDHL4l
	syoCRgv0x9FxzyQ/tod31mWf0iwn8CY9XlzQ+cV+YFO4Kauc5wmPFwgl/Lw52aY2
	gcN5eoyfgU6Q4sKA1hXGuijWiQPcwe986ydsQQzr1w3TgdpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41414cug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 25 Mar 2026 18:00:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0ba59a830so171113eec.0
        for <ath11k@lists.infradead.org>; Wed, 25 Mar 2026 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774461607; x=1775066407; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=;
        b=Ex1n1UHfHvUiCRx9opk5Psw4CB+raX77MZE8STPppfVaaIPc5NbBwA+Q+SLfcQlkct
         LjksjSlpXHL/AC4zwTDq1HC1BJ+LtVrQcJPZN7SYk7Zt1VJitKMNMuvEriW0dbXRU+j9
         thuiCKrfmY1Lnw2QBqva/PblqMnskltjzjtfhBpAExP7AWdQ/ecKRgv2ZGZLZGVXNev+
         nHWQVUhLQoubwktFGN/vKhdT/whbQPEmUU7aesWRFh83Jo5zNhq5W85mAY/hIXsmZfHO
         kTeaP4Q7Sb1Yx2J8yxeDrS36NvRr+SMJtaRnBhC5uxdNxn1lR0gd1ViX9bgbI5E//IME
         gsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774461607; x=1775066407;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=;
        b=CUd3GdajzAW3VYrhDZoy/ApJjBGJKn6BUwzHPiszp4THISrmZILdbgCewrLfVoSKRI
         /OkOBb+gvsK5jkJJ6blYkY20jjkjp6bOqErrEXctw1LVf+km95bVacwfcc4XHEa2YAW3
         ZszSCb3Fj0YEGaVNkdZrAlBHAqxChR0VIa6Usrpol+B/C8tvN9CQCaE8W1R7p/MUzIp6
         Ze0VK4quBrib482rwhL1YQN1VsBjzuRvZdL2QZz9h/s1sq9/ubaKRkX2MdcXTJ5CYzDj
         b1SHGqmXU0FsQZIqKicX4wYy4PtP6YwUF705s5wLsvZKcwa9m7TRhj/noa6QmCTz0FsD
         ZQfw==
X-Forwarded-Encrypted: i=1; AJvYcCVLwtTd1y7N3DVvlO0bBdeGLXqL1/VcNMaTOwV5uSGML7b7IqvrNkhzdE4SSYen7iKDZ0bPpAo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRKWVmAqZVmRt9rnvKX1996fcr2vOB6k7I6JDCq5CexqGQ1Wk3
	XoiQ+qDztN7z+FZ013YWiZ9fqrw1TW/Zve1o6utCTTAkdYz5IVun141lQSoNpK7DeNURLvK/6y5
	jPjVESblKvaCeroc5w0Blrt5uc9lLbWG8HKEgNOwl6EhH7GTQI49ArbZgSuIWbr77
X-Gm-Gg: ATEYQzzTU/Q6/pTJ13zHepo1ZJQU6a1XS48CLugiC/uDAPpRWwvcRp61s12mICYQyi+
	N0SAXo+4Bx/gv+gQ+HmGPXrJe3f3A16RYTsUY2WiDo86MdN0NH+neWuBYFrGC49O+e/NXDcF7a/
	VmE2v2zoasaApd2Jp0GG/MRUtVr8gPCfXdm8gqbFa5CTIi11mnzSmmhxdfvtc2SUq3GqgtuJrtV
	NJieMRMhgv0jzylVDP295eRPh3HY2u8ICtBfkAyYI+2VPd+MRT/edfrm4bUAD7SoGYcyYVS5JwY
	hHRxn9yxHyY4ZL9lKEqnP71/2KlsEzd2qXVhznS2eqODaBjP4Sj9zmagsMgxRNWxoSUyhZ6mMmI
	jIdiLtaxhkdjPtbbzFrYRW1xkUqclTCd8qaxAwRLcEXWZTOtznwxRpR2arw==
X-Received: by 2002:a05:7301:e22:b0:2c0:c152:ecc7 with SMTP id 5a478bee46e88-2c15d3568d5mr2650439eec.16.1774461606768;
        Wed, 25 Mar 2026 11:00:06 -0700 (PDT)
X-Received: by 2002:a05:7301:e22:b0:2c0:c152:ecc7 with SMTP id 5a478bee46e88-2c15d3568d5mr2650432eec.16.1774461606183;
        Wed, 25 Mar 2026 11:00:06 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec2690bsm428056eec.5.2026.03.25.11.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:00:05 -0700 (PDT)
Message-ID: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260325
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c422a7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=6dYnDcIryfdnK3l1ooUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: pq3GSdj1jdIV6XhAVaWu8UWPoj_Drc2S
X-Proofpoint-ORIG-GUID: pq3GSdj1jdIV6XhAVaWu8UWPoj_Drc2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzMCBTYWx0ZWRfX9rhYR9AeqEQJ
 MbFJ69da1yVh+rnhDCqxyStivDZsno9xvpYkUEqNfhaRQnZETrLgxatluc+8+Mr9fN8+JRlyyJB
 bJHjva04/ugZAlKHE/k6Zy76rZU8zbiW2KGw+7VjTUsuBbpZWVv+8rZaTa8MjED1Fm/gvs5wn6a
 f3N8KqK6BLUqKVf/oitZ9WQ1o2dbP00hI7NM7i2ByYJ+r9eqkMqp4X2Ks4BKke8b5bke+tHaU4Z
 GZCN3xu7kKeBBFEiXyqOmiYTpzVx69PaUaBjfMCmb1SsvT2F987nRc8qKk5FFt1+4UWTXUIOwvw
 dbd0Lhja7dD0ioJtoQyRfEeLsPpOpdAlL1T/p2kzkiwuX1lkEGRalFFxcnWYseLtTGT7yuzdQB9
 TmWQaZFOOEHq2DDvwyZULVPdSj8HzgLwVnPjeLgJEbnWELKwxayt9XbDfhp95yU70Cy0nTbxVIn
 LAsZG69gC5WpQfZRlLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_110008_140790_C5DDCDEF 
X-CRM114-Status: GOOD (  11.32  )
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

The following changes since commit 51d2775ba036b0dfbfe44c7ba0a1350ddaefc058:

  Merge branch 'qat_4xxx' into 'main' (2026-03-23 21:17:08 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260325

for you to fetch changes up to b56c03b621391558627e3aafe5a8dc32d3997680:

  ath11k: WCN6855 hw2.0@nfa765: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2026-03-25 10:53:18 -0700)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath12k

For ath11k:
Update QCA6698AQ and WCN6855 firmware to address a WoW page fault issue.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
      ath11k: WCN6855 hw2.0@nfa765: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                               |   4 ++--
 ath11k/QCA6698AQ/hw2.1/amss.bin      | Bin 5083136 -> 5079040 bytes
 ath11k/WCN6855/hw2.0/nfa765/amss.bin | Bin 5005312 -> 5079040 bytes
 ath11k/WCN6855/hw2.0/nfa765/m3.bin   | Bin 266684 -> 266684 bytes
 4 files changed, 2 insertions(+), 2 deletions(-)

