Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37532C021A0
	for <ath11k@archiver.kernel.org>; Thu, 13 Feb 2025 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QHH8TkTsDqaxKjXZMczZxcJjHOjjkHmCEvXQXVJNZI=; b=a1UVi8vblo9OT/jYQasOgPLcbW
	lUmHDOisicJf/3bDEqfL3FzOwc8oLd+QOt7New6L8jWvuQ2LtaA1A+WlwXMH0bE2PoUS4dSCHGg8M
	u1hG897SxOHJ0jINFcGQbJUf3ZD9gYBHrvuuXMhv+iSwcegw/fjmJEnILhYtJQaQ/2vtTkHBYA801
	IzXhA/gPzRvq2vr+3QENCV+oNeOo0gQKQOGXtQpNLO/iUt/BV4LmfKj9uu6zLmG3DtZafLrs/J92K
	vUbF8TgGIOPtNiVLQv5kNw++Pcg21Rlf5jlDY8jJqD71EmxToEf8d0G+Kf0XyVx8n0ZYHK+hLoBIJ
	DOMWb4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2o-0000000Cryw-41Hs;
	Thu, 13 Feb 2025 22:50:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2n-0000000Crxj-3mDf
	for ath11k@bombadil.infradead.org;
	Thu, 13 Feb 2025 22:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7QHH8TkTsDqaxKjXZMczZxcJjHOjjkHmCEvXQXVJNZI=; b=BekCuBkL2sjwY0ZR0hXBlyH7o5
	foZVko7ZZd+w4cxgsmQtQwJIIu/IiWX+9HJwkFuV3NRoRUhH+GY7DLV9b/eezcckaUodlDEteNjX4
	D8LM4XmBfWSVWDzawrvQpzMmUziHgBF1uXDAZk2Sa49Z2Mr/zfKWA6K6S2zVWG2iYepg3wgQZJtLk
	7mGj6Ap4dCRk4E8BkHwzBIigK8ONwpI+z55QbgjFWrznkl3VaJcAmjezFQ/kZ2uloXjF/zf4ogDoc
	nT9Qg+/JsAcMjAtLLnsTQkB5hMWbyDrjRAfxTOhzkB3V3RiJJ+yPAiRA+Z8nm1YCu/D1j8KafaLOJ
	oXeO9pmQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2k-000000018hL-2W28
	for ath11k@lists.infradead.org;
	Thu, 13 Feb 2025 22:50:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DGkAeX012379
	for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7QHH8TkTsDq
	axKjXZMczZxcJjHOjjkHmCEvXQXVJNZI=; b=ZoRytg1hKUUrjGBSOJJAWrqq8+j
	VybpfTXJ/mg2fbIoWbrs0bywqw6PDcaOdZWAoFvP6laNt1dJLsfd6asoxW8vKg07
	6p36H+tRQCXjIGsBfsJDeKxTdfIkc76Gb31L8bj7oT6S/iUD3LHzKLeu30um77VF
	al56JRVZyKI+SBN2vMIWh2DNhmA5ghHchIQJ0j+C6WIr7t1BKgqRLvyfbLQqsGYR
	b8q7V6hUw3/cJexm2YDZDliGmUbhxPZsEuRc8tK1dYbhZ6fLzJP4dSej6G0Bl6eJ
	woNuohuX0fJsWRoyybPlLt3pq2sefB4MMz4+f+LKPlDVUG+63heNnHpEikg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc5uaa5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f022fc6a3so29376835ad.1
        for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 14:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739487044; x=1740091844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QHH8TkTsDqaxKjXZMczZxcJjHOjjkHmCEvXQXVJNZI=;
        b=DGprAPIt4ozo4EWRKdy14GJG2hlzDMi1FXKlRdsC0sR++FXjPO7ldPmTJxn4KEiJCt
         k60i+onRrL0ZyU5gVs7KV369j8aAoMK0LmmSegbbH9xfaLxlu4be2YpElvpirT7MfrEe
         wjSv6BGPIR5Jlj8WyUdrGjtjYgcV4ksuj5WSl+1/I+8inJMBi+hENC/PY5cDds0HFOKL
         CyubIsETy1AdlexGo9W1DA0mlVAMGSKF8wvNsRtC0XgVrLajBs9on5T3+DXCfnRNm6ll
         wKCt3aubEKKNSwbY+ZV8zy3FwA0tr9Xe6FON61pWLv7ndPovRM1OPGK/4sAylFcundua
         8HNQ==
X-Gm-Message-State: AOJu0YyE4PnfpHwPygxc8kRKIyMZxxx9SDaaV9CmYNJE2etr1JAY79Hi
	Dwcr2QyDIms8IAlZlyPoDedU7i4/PkT3+Z+SfRkhlfvkIjT5W9B35C2zB5oLOeblXxON4Zdwa+2
	4qALqN8Pvx69XKcMtOKoOcXVj3fhmXy84UXe0lbRm+escpyUgEOEQEyNk7KxCEeoiNH8/
X-Gm-Gg: ASbGncuRkYVXp0puVZgja9Gbberh6KqZRino+wvSWDj2quU3q/5fs82vDgGwT2x1Tp9
	wK0t5IULBuLv0P+64CqJWnN8PFR7cK0eCehgmj/2bN0Rsuv4L3nDi3u5GAvkvjDgW2x9m75kr0y
	YYK90lqEuHA8vQ1Y4pqHV5rLmZIfEyz18CEOAMy5lDS5PMYEWv+npAdzcnAofmFlBW3My7gqqZ8
	4yOJr8HIULiRM2tFBbfdiIxsuX6E1B8f0NfySgM6RCLcDnVp3GhyV5xTKSO8Nolc05CSW9iqo/R
	rCn/Z3PEoyRaWCg8OKV0s5gRqKO9ikMw2pw6aGCh1R7hECsITOdUF12lKnd/
X-Received: by 2002:a17:903:19cd:b0:215:a808:61cf with SMTP id d9443c01a7336-220d376b0b4mr76445555ad.25.1739487044572;
        Thu, 13 Feb 2025 14:50:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKnPyFyt17H+NQBkHBzvQy8lsquibSIE7E5VrIS8ldflXSj55yntdLeifjiTlOlYf+cwECzg==
X-Received: by 2002:a17:903:19cd:b0:215:a808:61cf with SMTP id d9443c01a7336-220d376b0b4mr76445315ad.25.1739487044232;
        Thu, 13 Feb 2025 14:50:44 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm17571665ad.243.2025.02.13.14.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:50:43 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 3/3] wifi: ath12k: use link ID for CSA finish
Date: Thu, 13 Feb 2025 14:50:36 -0800
Message-Id: <20250213225036.3118133-4-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -y9WkrY4r9fmRsGdv22wKam6DyGl-2iz
X-Proofpoint-ORIG-GUID: -y9WkrY4r9fmRsGdv22wKam6DyGl-2iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502130160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_225050_911364_9649C1CA 
X-CRM114-Status: GOOD (  12.71  )
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

From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Send link ID instead of default 0 to finish channel switch operation.

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>>
Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 4dd6cdf84571..198e22ec6735 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6894,7 +6894,7 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 		}
 
 		if (arvif->is_up && conf->csa_active)
-			ieee80211_csa_finish(ahvif->vif, 0);
+			ieee80211_csa_finish(ahvif->vif, arvif->link_id);
 	}
 	rcu_read_unlock();
 }
-- 
2.34.1


