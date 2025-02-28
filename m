Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFD7C282D4
	for <ath11k@archiver.kernel.org>; Fri, 28 Feb 2025 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qF8i7KVqrk2V7E1Rt7ZLTFnAeJWhkQ3hP5vJGtB1q0=; b=Mc/QAznKOAoLhcvT6qyCMaD01M
	emSVTuZwzIXouUjBqfRItYV3s/ksjkO4V3ZxSdgwSEVOS/hQF53zT90W4U0KcBVdygASOHxzsuRdy
	z5jBL93Mg3faJ7CrjSXrwN7AEgJCfG5WnyAKn2DB6cltkDxO/sglyeUDR1qRE7Y3tVsxkfBoMiwFR
	zzaCkhBOKR9BhHqVEi9+2o5qaMNbNu55w1SLn1vCReUoGWNmUqsbwyao4+6hLi9dSWb6mtVrXI5lJ
	AKTphMetSSL7bd85ioB57DftH3ij3ErY/i6abgqdhgWTnkGCAucy8Js/ZO/pmKli4cpzJKcNmonI+
	5LY/a/Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6de-0000000CUvk-2Clv;
	Fri, 28 Feb 2025 20:07:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Tb-0000000CRr8-1dBg
	for ath11k@lists.infradead.org;
	Fri, 28 Feb 2025 19:56:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXKit018898
	for <ath11k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qF8i7KVqrk2V7E1Rt7ZLTFnAeJWhkQ3hP5vJGtB1q0=; b=kZ3zcWUmiyyutS9b
	nkiOjjG5CMxIX4ph7bYxDcpQU4I6AqH8JjMp0CfGJTZECwR+u3jkCg7BFSRLXyhO
	KDZR7lncO0IHG/kH7I+obZ9qh6jg4pqWaooQnDk0KlhGS23yrPflIZybXBhOToaK
	YtLywEbiP0zsolTrN8QfHfnX/r0pisHvN52rieydk0f/JmkfMZYCjXtpR7Ox2HeL
	mVvHzj9zRkAalqH5GBnPgOantdcehwV/qQtslJNDe3JEygdORu4MeLljSuPdc1C9
	TflLbeCcvIjYGos6ZyEHzg9by5Zgr9gL80nRsa9oSN4hKqFfkWJ0IrK+tDMxSdFG
	21D9aw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnaece-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223477ba158so77265925ad.0
        for <ath11k@lists.infradead.org>; Fri, 28 Feb 2025 11:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740772606; x=1741377406;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qF8i7KVqrk2V7E1Rt7ZLTFnAeJWhkQ3hP5vJGtB1q0=;
        b=B1uzsXyt5oYCX05LQYvkp3IrDs4ciR+WK38kiIYiBudLOWzuNeHPx7g3QCsE1QYuFg
         UePXQpkpG4LEmC/ORITko5juuqRGKK61ZDGhgPmBIAllMGU8zFPpDUCZ/2IeUqItAF7x
         eVblWCBlXqJeOr5+1OC6ZQ/GNnXiqDiZkCkjFJLTq6O4aoUWf09mtKeP/K0Auj5HqHgm
         HSzwvN5Zlniz3sOj2Q1DRheKWsuUJHF73wuabvMtK8cSsc84wcWxmKfudL/5Wsw7+Dt8
         vXM/lFY5evWirF3+Ey/2Mk/FiBJBCG5Ka/85+pisdt3Ng83M971BOMG3GrZDU1IMqED6
         c+cQ==
X-Gm-Message-State: AOJu0YxkMaqLnnz4G8Hqpk0kftBMiXofI09MLd1RDKQUMS2n5UO2D+qa
	5szVWP8SLdtewIEgZQtpppBT9qauszOKYlHs+Hf4syPwfSkKEXj79+WPly79O4DW3olEXAa3j9n
	aEtFaDjVilTaLr9X7h39+l8MJDp/i122k+ur0mFdZTNiZP08are25ixfwJXWD
X-Gm-Gg: ASbGncvjyXjGQLkUMweNBZB+dsdSjrkgJfbGipL051XyCQRkTifNvUuv/eyCV3nKvEG
	WXvdpvejrmf1wOgydXkE1a1VHRKt6JmBqjvKB8bEX38X28zJ8P5QK1sjYKcSnwQw/sVrcIYcL+H
	b1G8BXYArQAQkhuiOP+vsnqcM0XfXIetxnedSVu2QxHzZ2AALuTc0n7YOwrHKk6YXf2yfWOD3gS
	YDHLPJKngwbOUrbkd/UAaNvxxSaMfyHik/5F2BQtWN2QV6jtv1dtmuGfITqy4RGaXLAzLuWS400
	v5VFX1MQrfkyJRsdhGQD+CebhGAHm79NY5W5+x15FRtfEY4/pIDq
X-Received: by 2002:a17:903:2302:b0:21d:dfae:300c with SMTP id d9443c01a7336-22368f60a53mr72832515ad.3.1740772606363;
        Fri, 28 Feb 2025 11:56:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExZWp04s694oFSfVY12xSazXlY3K9MyoNC3J9R+QbrD1vGsWlXV56BmqnqfXnoa/uEc4Vg7g==
X-Received: by 2002:a17:903:2302:b0:21d:dfae:300c with SMTP id d9443c01a7336-22368f60a53mr72832265ad.3.1740772605982;
        Fri, 28 Feb 2025 11:56:45 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505336ecsm37140165ad.244.2025.02.28.11.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:56:45 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/5] wifi:ath11k/ath12k: refactor tx_arvif retrieval
Message-Id: <174077260480.4132177.11927601453604393606.b4-ty@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 11:56:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: u9cxc0DqSjsjkwBwEqwU28DzDM4e-1Td
X-Proofpoint-GUID: u9cxc0DqSjsjkwBwEqwU28DzDM4e-1Td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_06,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=901
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_115651_564428_17B3848F 
X-CRM114-Status: UNSURE (   9.24  )
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


On Mon, 10 Feb 2025 10:27:13 -0800, Aloka Dixit wrote:
> MLO MBSSID series for cfg80211/mac80211, which is in review here
> https://patchwork.kernel.org/project/linux-wireless/list/?series=902914&state=%2A&archive=both,
> changes the way transmitted profile data is stored for each link.
> As drivers currently retrieve 'arvif' for transmitted profile at
> multiple places, MLO MBSSID changes will becomes unnecessarily
> bloated with RCU operations for every retrieval. Refactor 'tx_arvif'
> to avoid this.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath11k: refactor transmitted arvif retrieval
      commit: ab8a17bc63e2d187ea4602e1d1b9baf10c7b252d
[2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
      commit: 8e30bfad4dc96c27f52b84b3fc5928252dafee5d
[3/5] wifi: ath12k: refactor transmitted arvif retrieval
      commit: 20fe6390b503f0c8fa15a73720fdceb2c3745c87
[4/5] wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
      commit: 5f1e9f2cbc2b8aff6a2bef9b67c09c8ac8923285
[5/5] wifi: ath12k: pass BSSID index as input for EMA
      commit: f4f5ee5e3a21830c3c4f1925108dbc7c3c070574

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


