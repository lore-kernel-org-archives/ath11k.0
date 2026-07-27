Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A5EC53209
	for <ath11k@archiver.kernel.org>; Mon, 27 Jul 2026 23:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lz5WfjU5lvnz3MSjE+QYvK7315ShwTnlbjTJZ3IztlM=; b=z4PRGgg1qY75F2e92Nh9r/FUlN
	EuVG8TLlhzD/p6gEp35waNMVld7Cxbz0iq7zG7PplqiY8fupaZgR301b15IFLT6r+4jd4eJRZSDxa
	192wAxZtH6E4Pm/tGMwKe+QFM8mGImr6xcAby+ObOAWkmMNILb0WYu0koBh+/f6eD+U9usvuCIC5x
	WeJ8L24/ZgXDhg3WtGbdJn5tZXiljy8zatfjQHElilERkF6LYHXSzf+xhZ11dI50mqGMU2lanypvZ
	EvVpsLDckXe92/PiM/hh0vJjtoj/84r5yqSHC91pVoSw8wONnbfwEwsLSU3V5IbWnMmzpK8KMptHj
	O/dYNMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUvC-000000045MV-3R4B;
	Mon, 27 Jul 2026 23:39:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUvA-000000045Lh-2ZPg
	for ath11k@lists.infradead.org;
	Mon, 27 Jul 2026 23:39:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RLbEsc935315
	for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 23:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Lz5WfjU5lvnz3MSjE+QYvK
	7315ShwTnlbjTJZ3IztlM=; b=EBdB74NavVCbBjG5ccRCjvPoAU+8mCUm+zsNhP
	r2oi8QVwO4ngm8+Zq8JpbGy6JZA5D+gqNTlmq1BeGS3+G8HwaEbDcpwc0+phJdYb
	UaSSN9+uO6Dvm/8k4BjpMHYikp22AeEERD20U/vTMFdEwasfSd9yBsCC2MwgEIvD
	aAUdLTkffxbGE2/eccBQNn9HLRCmGs3BaizeRxJ07KlWjB63ve9eITdHDoOnl6f7
	jfyBU6vKQ0j2GDXHC9B+v0uTzbOk+OA+hcs4YBs4JMzXxvRkcc3SqCYPGz5owKWt
	ldGxY1tzQ9CSQvEVP5+mk0S1Ce2bBILLiYmq3K25IRhVic0g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpadkj08g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 23:39:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso2185700a12.0
        for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 16:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785195583; x=1785800383; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lz5WfjU5lvnz3MSjE+QYvK7315ShwTnlbjTJZ3IztlM=;
        b=QYDp6k6xNOhztDtRnO061oxirJweH/6w/ZR3W0723YoLmFHSvdZAzjCtJ3M1VHOYZ+
         4iITAU0vdbRA7Mqrcfb9e1dWmUp5bR63ti1DFJhuPyeeu6IRVn1rF5qMsO/L6VMZEf5t
         WPJyU87OoYr+YFR5/RN1QT+B2yqLRls5iTFn3UVwQiJZKhF9CRKQaebgy44/BlMspE/G
         HPXSoOtYIGZ94g3NK7nMh0NIJBqNXXLuJ8kF/M8xSy1ttYLnf3r9u+fhLWUNnpZjqyQS
         GRAgRQ1TdqltGUaC3uOi9T+tbcKZlqUIKcV/Zo9R1br60tXlqdVfzxUauicOBFKIYwaK
         5n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785195583; x=1785800383;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Lz5WfjU5lvnz3MSjE+QYvK7315ShwTnlbjTJZ3IztlM=;
        b=JrlzIOgl4TMMkHjy3DvxHv2AahpxlXjRwaQISSB31rjo5YLX64KX7YVafxfsseLIec
         39tIUIDeldU6JfVEdh+L/e1L7A8uuSgG4ndr+jKQkjwHqFVXVBsTLjsRwc7LLZwL4+76
         2YkoHY8EInm0yzAGRXd1OIrSVdAAUDeGckRoxWaOHWfz4703KA231n0ZLtySnTz0ySts
         OcOUpSdD6koVlTxDbHHoRWYjHrMkz0WY2642Qc6QTGlzw3S9HCna2na/ilUlypjFz0iQ
         xlxJunn4un0QEOi3syqJ4KGrfOS76es3JW8iQer1SS7UMQ3breB8gyoQaxFY61ebm019
         jhsQ==
X-Gm-Message-State: AOJu0Yw7m3r0FXABPosWZ0upbUejn4dTL3+afgimWvfAW86+gRRQTmAa
	CLI3yFJtsff3pWcbhszlIqT7evt13KHF4DygDKqqQ6AeNOhqEnAZgMZOO3SRnuGZqhTExoALofC
	L3lejnfFItQdX9y+M8ums4w/4ZqCPcGJ6vYqmQW7MEfcfkFdyk6S8JI+FZDUZRyvW/i1oie5C
X-Gm-Gg: AR+sD13cpdqKux8/Q0pWimJT9NR7iOXQUkdoNkiLkKZLKS1DT0CToHOxMADoXU5JzdT
	JfXRClI7zxJSW8D35tFTlwIKc2B+K+4J/EVISzoDapLPxZrEGyPTBigFQXVTD77WkPgMLCc1ZOy
	a2VckL5y1hvVUpbX2hMgxjqFXA3xlJJQzl5yVNh4pZDL9byhCqfcYL57FG4WpeXrfeWH92iQQD8
	DZ7tttlnszQnhcBrDAjDDTEjBGvh1jFyd+OnVjQL0nwPZylBrold0H0DRG0JWvzCVM47slkt1+g
	vKm/2ujIAGrS0QZjHHrHezWsRRJlOmdYEAZPjgvyAHahC3y8R4ckeJ7ZffFW1jxu8zNTrvwNFKa
	feaqVUJGNuzcv2L4Va3k8sAreBgpFpz5cTspHMtIzJADfMlfUCJSulVY=
X-Received: by 2002:a05:6a21:e0a2:b0:3c0:9c19:b27e with SMTP id adf61e73a8af0-3c8ba6afc33mr21404637.76.1785195583537;
        Mon, 27 Jul 2026 16:39:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:e0a2:b0:3c0:9c19:b27e with SMTP id adf61e73a8af0-3c8ba6afc33mr21385637.76.1785195583070;
        Mon, 27 Jul 2026 16:39:43 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc413766sm37543072eec.8.2026.07.27.16.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 16:39:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:39:41 -0700
Subject: [PATCH ath-next] wifi: ath11k: fix leak in
 ath11k_service_ready_ext_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ath11k_service_ready_ext_event-memleak-v1-1-e8373d27bdd1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADzsZ2oC/52OzQqDMBCEX0VybsTEn9Ke+h6lhBjHGqzaJmlQx
 Hfv4rmXloWFYZhvZmUezsKzc7Iyh2i9nUYS4pAw0+nxDm4b0kxmssqOMuM6dEL0imLRGigH3Sw
 Kc1CIGAMfMDyge97WbaFryDxrc0awp0Nr573oyojBR8qwGzmd9WFyy74git3/tSwKTgcUFUx5Q
 lFeJu/T11s/zDQMKb29Kcr/6JLoeQ2hc0Nwo7/Qt237ALkGVWNLAQAA
X-Change-ID: 20260720-ath11k_service_ready_ext_event-memleak-fbf4abe230f3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: RwQxhLUhDi5QqzQwDHNBFHyAp_AtrqCq
X-Proofpoint-GUID: RwQxhLUhDi5QqzQwDHNBFHyAp_AtrqCq
X-Authority-Analysis: v=2.4 cv=Ns7htcdJ c=1 sm=1 tr=0 ts=6a67ec40 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ix1dB9U_WECUcgnmRBMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIxMyBTYWx0ZWRfX3mN9x/hsDgMo
 k0mAF9D1sA4tUX/+XmPDixRjFv23NuAvZbG6hZxWJx011CZ4vGtPq9DJFLLdJ2AQApz68ZHkm5f
 YlNYF3rBp0ZEaH5gWyM84yHQ9LztaVlX1k3RK2nTzzwG7gJm+f3ej/2ZbyZXwdxIqaW5UrFBQF2
 5erjl5OqGJGj8IGi/PcI5Kd6dAa84hNu0/KAjPXjV/E3W9S5wCI0GFUgoaPqdQbQ9JP94yr/P7h
 BxnY7a/PhX9bJL6y61HWI0WTnWTHgV00a3hz+bj7uCtjiWZmoO1lqD7YnS4hjGT1btBfMJQj+WV
 dX5NsMklUsqCzRpaWCRyMo1OU3ABMQgOPZrunqR+PBykUKJOllbNxuizrf4+kPTo8pEkRTJo7BT
 vQTm0O/6V0I+zgkzWs4SXE3FpcfMl4ZPJxjA8OliR/e0WX8qKbAOOc1nDvPdO8YuD/hMgGVYNic
 lDmbF6iPgoIyd7jFbDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIxMyBTYWx0ZWRfX0/ulexnIy5Uf
 fJJfzMAxqEfY9SNrq4zvxl0d0bQClvKenEpFQKLex9o/gJhJ7hu6yG3pt39S+LgKdyQ6bRFICo+
 b2G8rGUWWWnZu/1EcfESdPlnWvxo0cs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_163944_667680_E8BAE6EC 
X-CRM114-Status: GOOD (  11.59  )
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

Currently, during ath11k_service_ready_ext_event() processing,
svc_rdy_ext.mac_phy_caps can be allocated during TLV parsing. This is a
temporary allocation that is freed on the success path, but not on the
error path. If parsing succeeds far enough to allocate mac_phy_caps and
then fails on a later TLV, the allocation leaks. So free the allocation
on the error path.

Compile tested only.

Fixes: 5b90fc760db5 ("ath11k: fix wmi service ready ext tlv parsing")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2d2c6d7a4a3b..b2861c879618 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5124,6 +5124,7 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 	return 0;
 
 err:
+	kfree(svc_rdy_ext.mac_phy_caps);
 	ath11k_wmi_free_dbring_caps(ab);
 	return ret;
 }

---
base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
change-id: 20260720-ath11k_service_ready_ext_event-memleak-fbf4abe230f3


