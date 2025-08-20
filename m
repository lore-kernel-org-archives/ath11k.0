Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E81CA0EE4
	for <ath11k@archiver.kernel.org>; Wed, 20 Aug 2025 18:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ieO5QYvlXZ27cvWcN7TcUCqXSIjOdosqMsk86g8EQmo=; b=4mRT55fj+lgW6R6ENVW1OCpY/1
	9r9H98pfCN76KIjsauDChbbHMqQjhpT4H1mfFq3QsDRQDIEPbD6siopdWcHnJOw8mOQO9NJBYHELE
	VcWV9UXPK4R8WHrXH/xE9BkyowjbnaUSTEgOvzsbUvGH/XEL+RolymA3MYD8nFZZsdocADsBU5hCC
	gInPQpa5iLHNTIGZU0huim1dsLJ6K2qbkZIIF8FGW+1gL1lv0VuTrD5AdwRyb/Q+8G7ZccbyCnfD/
	DfVH+R7+YsbXqdsIpFWtlS0jJbYaHivaN6IYwgPTMivlRUEHv0beg6IYtOqrNL8R2Z4Uu2hWcnwdh
	+Sq9E/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonvH-0000000EiO4-2ZFX;
	Wed, 20 Aug 2025 18:52:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokg6-0000000EFNJ-0JEF
	for ath11k@lists.infradead.org;
	Wed, 20 Aug 2025 15:24:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KARRxP027686
	for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 15:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ieO5QYvlXZ27cvWcN7TcUC
	qXSIjOdosqMsk86g8EQmo=; b=VKJaRiT55u+wuZYcGP8KE/vctxooO0A5jv4jVk
	RyLaRFlpfdDWcV8vhqfhsDmYS9/s3knHZ0hXB+jpgmvlWP1+5qgI2VdzwbdJyTeC
	VM1tq1ObC4n8fCKqoa4weYjQ5QhU1LFG2BNQg3YlEtYdbCdftMoPIdU96AstXT+Y
	qqbZ1nudl1vYg/fInjOgVt3Z0hQZvOxGecIJEo9wHd+e33c3dovXiPx6yiY40+lJ
	cTI1u5l3hnzIaHt4IUMtomd5+6hmP9VlJfthSTd7715YkFH8Q75a1V7c4u1WPHTy
	y0HFkkO5VCM9+Hm/rJqaD5nVr+RWOvKk16V1a7J5BRvi7JFw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52at4n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 15:24:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-245f2a91d02so6052055ad.0
        for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 08:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703479; x=1756308279;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ieO5QYvlXZ27cvWcN7TcUCqXSIjOdosqMsk86g8EQmo=;
        b=MR+/pAP1p2kFXbv0gwtDbUCzB87TMwOGNEixBt3sEwefJWXiSjj1Sm3Iu1lKQxn8dB
         F7oMM1bxkbg1PtpHpaCRrnxOTpReldnNA1wje+E1pP4QpxLsDcgFBK1F0x/QdxNIJGEy
         g1GGqzt58SYP00h4BATikZzQHI18P0tKexPO82yiKl/8Uo7g1AyU+Qt9PL8JFB+m0Osa
         /y6NH9BYJ+pPyQKkpLRJFlP6y4/IXpkksLKNyG3RSATV4ifMJtkX6VY+4Vojw9tYnGRu
         qbUuXc1xO7tf0AqGth6bZy/9Fr1Gh9ZAuN5t4VwLwO0s04jW0TVauLXKZze1ixbaxCMA
         S1qA==
X-Forwarded-Encrypted: i=1; AJvYcCXVnM4pBTR0jMnP+0WDTCI3zOrSaSF4FtOVL+uOwxdi0QnlExmvffcIZidcy7KTNuMZIAJ180k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBnNAtyWoytXk3guS9/sltJ3tqOlTNkXyTQIBsDfdML20usqWR
	tLZILEICFS6/N3N1Rf20x4MRK7YHf2MA3059k+OtfMr0mQdCvgXXk4tEAOqcFuQnDkfLu+VPmmD
	uazrIYC3flTcBzhXsJvY3mj4zYKaApHW44J/5Ll4ne7LaKeEvKmowXBUL12Sz15PY
X-Gm-Gg: ASbGncvjjF9QuL3YCmBJApkIyseF5Vh5O0+gdFftvbqPBp+KqNP/38ur8pQCzlWDyGd
	Y5eiAAkr3T14DzhQKMdfiZa+5qdMGKWiQhH2Wy7Swyl/KSv1oQIma/9uA1yMh/5YkOXndaM1kyK
	2OFa4Td5Ouykm9YQGSnP9qND1Kfd28G5Km+8qZ+zvSBFLSXzm2k8iKTkIh6v2R7pm1cw3R3uc1O
	CoBtOvRsRDBFw7/pVm5SgQTGvSJLUdFe8V44TOxn0tp1jD1+hRvXO/wpVpEzmplWfDpEcY8uTnh
	/E7IBhyGrti+j/NYcDyASycYW3pIjJ5vaHuqSoJ9Y3i+3PH65lychqcNi4ZIqZd0CzzALBdNjPh
	n
X-Received: by 2002:a17:903:1205:b0:240:5bf7:97ac with SMTP id d9443c01a7336-245e09d0be4mr86387495ad.16.1755703478640;
        Wed, 20 Aug 2025 08:24:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0VKBXRsV4LWznZ8KguG4ys3hOJb+MIIxxdAz09Ju4QNnohG2o8peVOrH0bhoqJVc9guMWrw==
X-Received: by 2002:a17:903:1205:b0:240:5bf7:97ac with SMTP id d9443c01a7336-245e09d0be4mr86387125ad.16.1755703478206;
        Wed, 20 Aug 2025 08:24:38 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d511sm29919525ad.50.2025.08.20.08.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 08:24:37 -0700 (PDT)
Message-ID: <323382be-397d-4df6-976a-89319fe97202@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 08:24:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath11k firmware ath-20250820
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1BecZmF0O52r
 X9UnuB22WD3qAA8e95867jRo0xfP+83hzZrvXXdMbZvyRnqeOAGmQKljyLzwPAoMZ4bxeVYaMs2
 ZQKp0VjndaJ4DIv7/JMzLPijoA+3KG0nURGkaDQzIM7Mft9Tloc/vkd8OSUzKgIus5OLmBQOwL9
 FkNDE3P/CuTqCdOQ4Vxa/endsBn7qw5o7rOe1nfPsBo0eogJ77ELwB2hdvMXwR+GYvtH5CgJIf8
 Kx8mKWOp0pB2qhNYCf3O7cud7NkyzxSDKE3U17t2fuutt+Fq/CjqkYBTHeIDtgzcNC+NLQRn3P3
 C4iLuRHwIc1WQwLKQG8b/sVfysVKOA/y0bErdo3abIeNCy816JDjMVdq7F5+QJIPhoNhP6k2a8J
 qoAZV1RCAjYmutZAvtXIseq4fNrYzA==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a5e8b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=SvOVevs7hV0f9PBrymgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: Co8Yl3GkSUJGPja7AJNGMhkgJEWhLLx6
X-Proofpoint-GUID: Co8Yl3GkSUJGPja7AJNGMhkgJEWhLLx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_082442_232214_441E2E0E 
X-CRM114-Status: GOOD (  11.33  )
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

Hi,
Here is a new pull request for ath11k firmware.

This adds an alternative firmware for WCN6855 that is part of NFA765,
optimized for IoT applications.

Please let me know if there are any problems.

Thanks,
/jeff

---

The following changes since commit 5dcaa87d4035f437acb9d8817d88b26932269863:

  Merge branch 'robot/pr-0-1755692386' into 'main' (2025-08-20 13:19:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250820

for you to fetch changes up to 71b945d2190cbaf6bebe8c1a8b0b41a71d65ec31:

  ath11k: WCN6855 hw2.0@nfa765: add to WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-08-20 08:01:38 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath11k: WCN6855 hw2.0@nfa765: add to WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                                 |    4 +
 ath11k/WCN6855/hw2.0/nfa765/Notice.txt | 3658 ++++++++++++++++++++++++++++++++
 ath11k/WCN6855/hw2.0/nfa765/amss.bin   |  Bin 0 -> 5005312 bytes
 ath11k/WCN6855/hw2.0/nfa765/m3.bin     |  Bin 0 -> 266684 bytes
 4 files changed, 3662 insertions(+)
 create mode 100644 ath11k/WCN6855/hw2.0/nfa765/Notice.txt
 create mode 100644 ath11k/WCN6855/hw2.0/nfa765/amss.bin
 create mode 100644 ath11k/WCN6855/hw2.0/nfa765/m3.bin

