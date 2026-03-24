Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9365F54AC0
	for <ath11k@archiver.kernel.org>; Tue, 24 Mar 2026 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=; b=D3CUo4imDFYfIhdnuVansIZYUR
	Mb7mh84TYxFuVy9ZHuTUt/114qwbH8xefIlqRmzLqAZ+P3UjgMalxfkPGYyV5zUghvnk33i/x1mzi
	QFE+DBBu4YCfJT6IzyCcIwvh14r2DUz4orC7qcmCd7yyVYlIdTHUKa+xdS7XcaC/Wp53HPkggRX4B
	CdKjmT1HRi9YozbF1c31qlWPlg1D5za8fJemVzaVYx9DK08dN8oWCIxXFwIYoMWj/cDUY2o/oz6SQ
	UjGSL6L9opbrBxCjc5Pyyf8PMJ14bh1uocfze+Y6uOXs6wQXtLswCg23KYalgECRkyLygi90W5fkK
	60pf+vyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52b7-00000001cjo-36vE;
	Tue, 24 Mar 2026 14:19:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52b4-00000001chi-0gMi
	for ath11k@lists.infradead.org;
	Tue, 24 Mar 2026 14:19:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ODXLhC146467
	for <ath11k@lists.infradead.org>; Tue, 24 Mar 2026 14:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AFEWlTNSgwy2TspeiD1fvF
	mTtd2MiDsPAba4aSIeMGo=; b=ivg/mWnZ400T0g6ggTpY1VKzyWpyN1gi43+q7t
	Fe5Zkb9eT7uOCj9YDH+/dVwrE4YVL53hCq11dKbL7coYWqtiQVcV6NzH4s64L6T2
	6Y5TTprvUz3EHJa24vb5yVw0gZRLy0nFWrbpzEWYbHZIWiXS2qMPUlUMWBecEHa1
	T6UCWTTejkBXHaQ3xD3xfJhA1QcxUHnb5GcYIb3n47Bh53T09/wbZHe1CBOAqIT1
	lfNaxLH5ZpS8XBpob/JnBs3tN6pPNrexokzt9LG/Uil1px8Kmopbl6DG7U9ecB5w
	Aln9Jwf60+yJMZ2FEgzOHwLFdAn6xwTSPeANDEgMq43WJUpA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm85na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 24 Mar 2026 14:19:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0d15416b3so19478387eec.1
        for <ath11k@lists.infradead.org>; Tue, 24 Mar 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774361944; x=1774966744; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=;
        b=hNYgrBAgQQrezrQLYJW2gOCFa7VWRd6BOdr4phQ2vzLYelgiLrPwVcaKa4rlK2ZAhM
         zivvSlme84Es+hB5CgPd/CDUESnS8i2JkKUFbQGWznjIKY0Aefw0UPYKzLuikr1tg5Q0
         cwws3TkPo3Pq6bnPAaIZXs/Okd2Gm4vUzsU2vqUFApTqOHZCCgSLND4IA+S7F20lcSsA
         EH6u4zlvVcZjeL/16nbh/gBvOEirx0oUyq3dfIewYwoE0dVqSmP1EXYMBXk469LOhb2C
         5t18wLRqhtLCrjBZnw1IM9ZLbmb8pwJSIre4QuGsC9tVSsVWO5lg5v8uOiDcTt3QaVQG
         FhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361944; x=1774966744;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=;
        b=d0DlOO03AniOe8fyPXiW61a8op5je9BjRgoKqBjdTa6cbesOxN1GsJegQXPLzHqW+L
         A7kkMLdFEGWYu/mBt5A96ohH9hVO0GFxGIrY0rX++5kjfRx5DPhIDUaJDoQ5c5g+DvbX
         1bACqHynoKM/QPXIytXz6hToD7XIAXNBVzvc3cREtvdKuIDzpntm2zMfQsd5jgYQl5Ev
         amfFHUvoA3eTxIC7KAcCU4kv1tv2xn4Y+p3NO8O3Jr/SSOOOHLq5ZzSEWu4fQwRVRTCP
         pIEI0KNduYzDH8xlbTCgBCihgTfuoLvciVlXniK1ha3OlIGagMgbA3ChysB3oGfEgcKv
         dtrg==
X-Forwarded-Encrypted: i=1; AJvYcCVaBryxXU3oGpU+hEj9e4eOQOuupqvr/Du8riKweBipIulU93RumXXWtcS6w/lEFYwzMjl42sg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJR77qjcnM/b2fsvG+SGB5RgaA2W9tEAmBAXlKrSN9b1LHi04L
	dbUlW4EsveCYcM19Td/jQhELkbAg2fUBJ4dR3/s5kt1Hi42gsOdn073FCOgDy9efWknAT39dwpq
	38pIRt14Z0FF9cvwe1P2dXwSE9shKaxrgQqcqq96/aBoNeDwrbojIoMAB87oioT4Q
X-Gm-Gg: ATEYQzxgGZGWyT6rEiLQOqLjZuTLBQKAT+8iA8GRtz1HrAGLxUHcctMj0oDC3P5TGJf
	c+hf5EKVkcLMGAQtyLJYiGjU1BGysILMjDf2tW+HkFkzf1E49GGG5/z6EeF+dwUSswOWCMFS1i1
	PoLKOz2HFBSRVEQ2sExgfvD/bK5tB6IYP2Evz1yfAv7baSESC8iHs2a0OggWR2B+dCkohqkqNka
	1kIoiAo3iRHYJhmCl8ybvK3l252Uznuhq32O258Xp9V/OV89rS0AXddxYW4pVIj7qPuYhu+N1NB
	ovMRc5oenIOrlqQt6JasBn/ovXFHRgWMHYVnOu2zKc5iSsshzbULyn5jm7T+S8zY2bqBcopSGuS
	4PSMXCBkM8PRmXLGQvmzGkG4RFU96FSslxAadamxufg5lBxQqDcDjFDUFHg==
X-Received: by 2002:a05:693c:3005:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c1097c1a0dmr7850345eec.26.1774361944037;
        Tue, 24 Mar 2026 07:19:04 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c1097c1a0dmr7850313eec.26.1774361943372;
        Tue, 24 Mar 2026 07:19:03 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1313bf5fdsm6899720eec.14.2026.03.24.07.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 07:19:02 -0700 (PDT)
Message-ID: <1d9e6d43-6014-43c0-bf47-843ef08738b4@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 07:19:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260324
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c29d59 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=3k6IHe8u8opv2P9pMhQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: SrNPs-J3oiQaWCCo-kCpBge1jZVK1bcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMyBTYWx0ZWRfX04F1h0z+Ox5z
 5H6Sy9MxLNe3jWJt26lGQyIFsKJjDGU80rAdupBmE9JWKPxhNiqW1PgntZNL88IcbitMikFqLTU
 2F70Jo/1oem9ZUNjrjyGasScfXdPYV3GhoGAWomWl4yDj2uFP6Y7H3/4v3exroLDH4POTw02JbW
 1VYNN5ri+W3/ZsTl5dX2XQuTg0ZPw8k4cpKb9wKIXP7M95fMllKMb+4jaFnDibOChJMtqOMbP9c
 d19HsnROLwmbwbBNoH9b91Jo8+KsdJEVajiDTvCsL+JvJQLMQqvfmyHFG0JzpQqdCZP61wtMNJH
 q8wQpf9GWN786QLC49MlnmqQ2bdyQSb8k+UxkOs9qRQO1aQa7zNsF+22b+00enqDH7J9IPnhdZ5
 8mr3vnELkhKJAmnlbTZ7xgf9E4thjgEFLW8xon/+AWhc/2n6/wYfKcaNUxgoOwRKm8h4YxyVZ61
 TUmLX1K/o4mzBcVgQaA==
X-Proofpoint-GUID: SrNPs-J3oiQaWCCo-kCpBge1jZVK1bcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_071906_446444_798E1A61 
X-CRM114-Status: UNSURE (   7.22  )
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

The following changes since commit a1d9d8e833781c44ab688708804ce35f20f3cbbd:

  Merge tag 'net-7.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-03-19 11:25:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260324

for you to fetch changes up to 4242625f272974dd1947f73b10d884eab3b277cd:

  wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session (2026-03-24 06:44:00 -0700)

----------------------------------------------------------------
ath.git update for v7.0-rc6

For both ath11k and ath12k use the correct TID when stopping an AMPDU
session.

----------------------------------------------------------------
Reshma Immaculate Rajkumar (2):
      wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
      wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session

 drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.c |  4 +++-
 2 files changed, 10 insertions(+), 9 deletions(-)

