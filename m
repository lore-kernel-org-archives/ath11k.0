Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC5606A324
	for <ath11k@archiver.kernel.org>; Mon, 26 Oct 2026 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TGG0LX+1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Igk+3iVG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nip6shFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=; b=TGG0LX+1wZDVoJ
	WsU4IH8VfxeuP65FR//2GTK7FizCTlpan2cz1Jozx48d/JG4XIo5vhM5CHWPvJnHhQURWIjv8CBgz
	LVMb8SKkDAqXnHRm17UuGszp2YGsQHll0PHi35SIU2hpN9ZP4FkhOaWbLE+seYa2EEcNqX0joQkqn
	OP0CCVaWmvVrV+bXr9QDbtatkDJVLY6IpdFUesvW/SeXKeaKwkPdSm4OPfFmVxLEtNhmVLQRxAyQt
	n7G3jozVNvqEFYnX+GtfvdCl/ghYdYcwzxCa4qOSWpz5mgyb5P94eldwRwzWBbQiT/by09L+2F9zF
	HWWoCF0GG5LG5VWShtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLE6k-00000001mm9-2bsS;
	Mon, 26 Oct 2026 06:22:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLE6i-00000001mlA-2lDM
	for ath11k@lists.infradead.org;
	Mon, 26 Oct 2026 06:22:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b4331340479
	for <ath11k@lists.infradead.org>; Mon, 26 Oct 2026 06:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=; b=Igk+3iVGlbz5b6tB
	V0gA1Nrz0Jly4J1OoNE4xjoJzvyRPSUvYvWw5qqIicKvSIFMpsef8xt0gCj8xm6u
	m+3YAe/99SqF4IOPJYeMV3u2Ko1V4qRB6G2Y+eMGuU5FssFwDbDQYNrc36fCvlYc
	O0BbhCKv3duQ+abRD280UU5h5nx3fFj/1/w+yVP+P/zvM4xQI18VQikn4VPcPZGP
	nNEITFedz13srfsp0fnhIfkYyy5z5Y8hYyDCG8prtOzLpxBgNC8oL06RDGX2Qody
	DkZl0Q1IRZ6f5nDTmYLGJMLnUFa7PLP0gfiyQh+/vS/XClLzwNAIG136J9NUOcwJ
	xlMm5g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9vw6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 26 Oct 2026 06:22:55 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18eb2616974so10200549c88.1
        for <ath11k@lists.infradead.org>; Sun, 25 Oct 2026 23:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995775; x=1793600575; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
        b=Nip6shFMdqyUqfl8SP3oVAaPUwgOTsC1E8ggNZRnHW0VYiwO5PtRg7TWNVCvlnKr8G
         MYOgQC79axtJ/tLS2IKlQUuXPvprbxsxYJJsI6BQJuUtgwLZXaX5+5dl4Prz96X2TNdb
         w1VY6rOSTIqe3sWIZex/mOQPwkxsgXdUSA2TpdgZNrGr9TN7cIdeuzfHynOp4XZRhKj5
         yNQVFx3DlXvRv2fVL8zrs8KGaNF8UUiwReL6NS3D7wm1ok59E3F8fuvmUuv+L/8tBCpe
         4CrweurLbbCHsn5vjB41j3M04VbcdVY2nSSafP/aP40KfNn4p25JPCHcJUqGAhzqDxay
         Pllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995775; x=1793600575;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
        b=tkDpK/bzXmhyDzZ64Xi05PBlGjE4tFLomwkoUqvJerxOiw1R0A+I+Wt8GzSgrUZh3p
         M4Gz8pupgMmfbTR9ELoi14z5hLKpzIsC+sCNLAJQ5/LBnPpJJwn3XiY9YQ58mQWiSHdt
         2GQ94OPO0FKhqDd3hoM1UtQKnX5fXjeH6Wc9eUSAGx1fsLAqSVCgPyytsRI7G2WZneIW
         imMoZzuG+9NHMFxqFCoRn/F+82PdlgccN8yMYQEAao7Ya4BAKT5c9JfAUIMVUK7PkKLN
         peDFVJH4C9YIhKZ+YbtYbgnSbW/XrJd1JYTjAKJ6ApTmA3WcViImpWNPVS2Qz0CAOqvz
         P+xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU52/2OAyjFOV1URwcUjNXOQknRcLTk1PJ84PG2eoD80Uw+HA2HglKjHHYZMZgTLz1gPCbQaI=@lists.infradead.org
X-Gm-Message-State: AFq9FYKOtGkCoZWUlWXWOB70kQDwccTGtCqWOjEgh8HdyS2GGXm5K50x
	Wjwn25Y8s5cwVlns+0LlNfe6EetSzfzBTm2BLef8Z1aLnNvJxd5hD3sEOX/4k5A8MooVCA/783t
	nIEkytyEO9x/7yu/1To9hjLOnL7lDhofkNlrhUF69YAtI3C5AJYF7NiTVevw1A76/
X-Gm-Gg: AYBFou21yRPBOrs39UIjRHro1+brISF5H30t7kDUz4HtgmZZEthjYkrTwG5LEzL29lb
	8pBYtgdn+WBCk40qXOzu0mkLmTNNH/G5xO/vms4n/StN/4pxoc5Ryg+sOHJ6aGMJS4RH6TQ1zyC
	/BBsdDkVBsUJ5oqyy4RA9OFfrBSm9Bhhvzj6hDrl1WwnnZ0tanfKr3TQlp0a2zld6vENb07rzgM
	mm//65pWSGI3FI5Ebk6G7BMqXWEfehsreuGAcjwVr9rnDEwAv+jPMWkNbOs5x6LFeLQD9x1nDs0
	3WA6t9ASSSOABH3SXQu5LZ5k6e1m5jc5HbRLaPmNXMgrb0l6bj66ER+RFSGpodQnP8VUiHRPMMh
	6k/vyKZbg278hsCK08cINglCLo+8uHurW
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr8204922c88.1.1792995775092;
        Sun, 25 Oct 2026 23:22:55 -0700 (PDT)
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr8204894c88.1.1792995774577;
        Sun, 25 Oct 2026 23:22:54 -0700 (PDT)
Received: from hu-daizhuan-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm19719783c88.19.2026.10.25.23.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:22:54 -0700 (PDT)
From: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Connect to the QMI server belonging to the MHI endpoint that received the packet
Date: Mon, 26 Oct 2026 11:52:20 +0530
Message-ID: <20261026062244.2875432-1-daizhuang.bai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com> <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bZs3xjBCBShsdEGkwWviDqZ4LOMJ2XJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX6nhlzZwH6F1Z
 6DyjiYiWRpv1WTMYBPgNayb3TetUW9aJg4U3DMCzRwJxEhDz36dGb+jBbtqQjhGbBd9FPW/6TnF
 r0BJFldQp1nzJSCfIbXWS474aXBoCu3Zc9khgBIYcvh6YwzwxrHl7lZSlIz97ckssFUqazcc8Oq
 5i066siaTKgihKefXyt8ppl2JD8EXqLwinmftm5g3gmqhztXoiyLAAxMvkWr5gUr30uqoQpfhPN
 CVu/Sv5XUx5AvtOm7fD2TeSGD1JyQYHJ1MilYZ/8z2c5sWem5ka7f4l+vPyOFzI1jFBMOuI1lj6
 p+xIr/NmnD5vIs3JpHz/2HsUt3xv1Bnkmc+Bhm1Jrb8oUS8gMcFIPBTlRlwhoWo4W9OVsdl+Ogl
 wcdFQzQj8/c6ou9uIB9BAoq1be80bu2t6tb7AETSyXwDb39pOLyB2ALR3cSsGayV0SUO8i0mat3
 kMCuKrMCBhX+2CwwG8g==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adef1bf cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zDojY5Dqmkyknr1b:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nUn8ewCANHEy0S7HLBYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: bZs3xjBCBShsdEGkwWviDqZ4LOMJ2XJi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX30o3pflra7et
 Lbs60dXd7bQB5c2I8VVpzD6oCU/QPM7Br8snIsbGGjdnigW41cLisBGqQOLk8I9jAMYxCWaLybe
 TUCF00ys8Lq77EpNYI+1J2Cb47Jp3wE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_232256_699084_28E20B48 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

I took the entire state of the QRTR directory as of after these changes,
on top of 6.18.44 kernel, and with some trivial changes to avoid conflicts.
Then I cherry-picked the ath11k/ath12k changes, which
had no conflicts.

Before these changes, Cologne WLAN QRTR NID could conflict with CDSP QRTR NID.
After applying this series, the conflict is gone and WLAN/CDSP QRTR services
work as expected.

