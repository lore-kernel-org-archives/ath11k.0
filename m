Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15934C83F2D
	for <ath11k@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYe5JEQ/NJBdGO052CLNtnqKAn42FRtb4sm7urxF55s=; b=dkCNextd7akAlUt7v2hKsOnFza
	WDwb6sWLEeoSt64cbikjJtRxBhxAatl7TFc+99SNydbdd+6+NFcIGRr6LHlQoNLqDa6FCyzFVtwni
	kVEiZTpe5pSpV8nxpUJ+WlXQa8UeB/Vc8yXNanIPVGi/ND1sAv9xL2mgwZb/YvgcuUOnjELSbbgWz
	2B79bmDkGRsFWu0mC8kzWzwXJkfVVxgVxirTGzlDFMD4R3WgD1l8GaKuKWJGZsgi82eSBpJAAe3RF
	bJL4NsNyVpZlBHb6RCQLWjN9SmgeHwqluNOisEc8HSZ/RTvoizX9gxo+dykW58LwuBNWKchRLcMg/
	bgLl2ECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnC-00000002ZU6-2l9u;
	Mon, 14 Jul 2025 15:08:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK08-00000002RbJ-1ihU
	for ath11k@lists.infradead.org;
	Mon, 14 Jul 2025 14:17:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ECEQnW000324
	for <ath11k@lists.infradead.org>; Mon, 14 Jul 2025 14:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uYe5JEQ/NJBdGO052CLNtn
	qKAn42FRtb4sm7urxF55s=; b=bLYNq9MzOyM9dXurG4DhYAHNGDH1bJRR6TXm72
	BEFhSQQsLvNca2nzXu0l1OY06y/nS6AJz5wZyHRltNXGqRLM0bHNt+1yPT0HiFAb
	Yb1B0i3mf7R8Vt+BiizpO/7WaLhcCko1TSdqYMFP0fThmqNJQtlqBSAwM6wOmESr
	/LCniaT7GdG0RVhu9hRPx44sU5xFL/GHl59/Sc3ify+F42HDKiWM/ddwAALPEdfq
	2QhTH7R3c5hY7pwME5+qAZsBZsUEialXU3a1jMVeHJwC8fCNHVC0PKpKzX3Gv1Jp
	8winSY1KHLLlog7NtRRsLXPn+7Y2c/Xq9TALALu+5Iop2zSw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvay1g74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 14 Jul 2025 14:17:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74928291bc3so3727620b3a.0
        for <ath11k@lists.infradead.org>; Mon, 14 Jul 2025 07:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502670; x=1753107470;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uYe5JEQ/NJBdGO052CLNtnqKAn42FRtb4sm7urxF55s=;
        b=J+WMVXWAtMSL96LPrvH/cJBHmtrN9HBXDm52GnEcjN6lbrQ3e4vYC5JsT4HYox7wa4
         xB5sR2k77WBXj7CgJX/z9KzY7V3fQGzEhFtA8Z9CaNaYRP7VsmE5ninkgwEsGbpyNwUz
         RbjZipGXTDoceF+ONGM3J37hbO/oDkVPVrtRSUTnQX7uFgNv/fMoEiSYuQuvt8chX5rH
         C7Xqg2cFyx5NCwRw/uIguN0tWrD0Ervh3DDsomQrybthbHOb7pnHdnU9Lx9o4cvyNMmC
         zuD1rKx00LZYvnF/XcUqxQmQiSb1FI9OdQdicdSo6gYAoFBhK1zd7eyXHykHlmzgYeNx
         i18A==
X-Forwarded-Encrypted: i=1; AJvYcCUGJVPoCGpo5jpqrgh+0mEeiWlo0Sf4nuiE43rtdOLpaCAi25OjtG862tdZSCugjaUFlNQG3Cg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoZqZGr8UelXG4u/jnkRfDZotbsTGXGugwKsntPqm6iKHZXYAP
	XR35NTwjAl4XltGYNWje1w7POsQUH1TCKE0bB+emD0/Kr0SVlcqdzo2Y7ZboWQxXAD9jUr94cJc
	14agMPzNaCSA+Y8Ky8/Xp5484HBxM8Mx855ryNQ2G2KkAzYlS762Rpm9cf23dRimH
X-Gm-Gg: ASbGncvdFjH+VZvCub3pifBXhe8iiicBmF6wB0W2Aw9jyBFk92Q5CNQTM7jF9EyGIaC
	7nCJs90Srsq7NZAYfkRhuxX1eds+OOrjeog+2AgC0r9Jdqi9AX5iWpuXMNFD+zZhD5R8v9C9mtR
	DhGhOR16Ubmi2Ixlsp6LRddvo8ZSoKIgDNqWo+jINowQ8VrVUlgxWEpmeUc2z42c5Aiv7BjVAIW
	k2M0jXtXpPpHf/7lQGjQQW26aejn8eWB662Np0KiWAH9Z+dhDVkMotkjNMoFZipQLFvacwevLZK
	7Yt0gbvEN0P/Eb4JZ44vwIVpzRr7iirCo0BHrh+OShdKdip6a8vRte+yYZgzzjqvmwlutFVLmiQ
	x
X-Received: by 2002:a05:6a00:2d15:b0:749:112:c172 with SMTP id d2e1a72fcca58-74f1ebccf03mr14544862b3a.16.1752502669683;
        Mon, 14 Jul 2025 07:17:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgfKx6sUk0FX4r+rgTdQmHFsfNOtS1CTSqL+Sp9TUZPq6HVE3canvzPacPiUNgm7i7hhR8cQ==
X-Received: by 2002:a05:6a00:2d15:b0:749:112:c172 with SMTP id d2e1a72fcca58-74f1ebccf03mr14544818b3a.16.1752502668996;
        Mon, 14 Jul 2025 07:17:48 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ebfd2d26asm8796236b3a.76.2025.07.14.07.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:17:48 -0700 (PDT)
Message-ID: <eb5bee18-e267-4fe8-9200-5a371a15539b@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 07:17:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250714
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nRly_dTQwLBpi2iJoNrL-cLOO7aF_Vv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4NCBTYWx0ZWRfX9985m3jt0b9l
 gPbSye61gj7gd+T2b/pMqjcLc1iMueLl/pmkhTpP5pszrZgVQNgUzTyARBlJAShXxd4PCaKYhJC
 GVXoHAnHey57rBpR9Nu9u0IhSj2ncEVlNti+PZx2hg+TGkvAqljMEQPdtEqlmfsym3cedFfURQw
 WEMwQDfY+BmpxDGLPZ3+iJo6De0orm1DMEpOcT3oSXV3fo4J/O8g/3+XWmxjJqHAlFSKWiio5Dw
 NVNiZvwsvkPnfB2eSm7aL/InGZpM79yPu3PjGSnRf97fRuOx5fP76ollvaGDEDYT+vbKgo7Xbx9
 DW+CHHEgYPohgUzBo47jpxt3BQTOmUmmhGzmWSycGRl/oFiVOb1xykVowJvN86ga3YEKC6T7e9c
 ZCz2FxBAHiuXdZEX+qhV0ol62sLUlSap5u1t8/klBtMN8g0VyBVH5+jyHV2vK7C6uZ98a0Pz
X-Authority-Analysis: v=2.4 cv=GNIIEvNK c=1 sm=1 tr=0 ts=6875118e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Yt6yo0lQyOCnsUEz3GcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: nRly_dTQwLBpi2iJoNrL-cLOO7aF_Vv4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_071752_458447_D138B031 
X-CRM114-Status: UNSURE (   7.68  )
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

The following changes since commit c07981af55d3ba3ec3be880cfe4a0cc10f1f7138:

  wifi: mac80211: add the virtual monitor after reconfig complete (2025-07-10 13:27:14 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250714

for you to fetch changes up to afcefc58fdfd687e3a9a9bef0be5846b96f710b7:

  wifi: ath12k: Fix packets received in WBM error ring with REO LUT enabled (2025-07-11 07:35:02 -0700)

----------------------------------------------------------------
ath.git update for v6.16-rc7

Fix an ath12k performance regression introduce in v6.16-rc1

----------------------------------------------------------------
Nithyanantham Paramasivam (1):
      wifi: ath12k: Fix packets received in WBM error ring with REO LUT enabled

 drivers/net/wireless/ath/ath12k/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

