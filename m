Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97FF606A883
	for <ath11k@archiver.kernel.org>; Mon, 16 Nov 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkYVcsYs;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiuHRSJR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=; b=RkYVcsYs8XS35x
	8XKK90LWx4h86jKaoC7lWsYkicsxZxYOkH5s7wBtCQ6hpSQ8I/dY6rj1Ym8ytcIKiq+BK+T8l3jLy
	JQaD8nOoZDlEhX2SXlEXDDO7PJaQh806AyuLFZU/TYywLSVk2+/Nx6KezVisgKIG+mxI96wZOORSs
	nBYd4pkm84E9S2t1FL3QOsg8YSYiB1T805h3TyWi1IwS9giLaAPiUatlVoFYUpDqN4m4vAq/POZI1
	+A5NyIP5rF7Y9wObcq9JwIVCOnGN44GD+tr5L5Xgx0EnZhqgjRU/R6mdbGR5Dwypy0T/Xl69tgDfL
	C9M22Corr6PCzpneMLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyBB-00000002xiA-1T7f;
	Mon, 16 Nov 2026 14:59:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyB7-00000002xfz-260w
	for ath11k@lists.infradead.org;
	Mon, 16 Nov 2026 14:59:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrSF5782279
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 14:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=; b=pb3Il5lDZV8XGrNM
	LLuSfhhHKQPYEpZyE2g8CuQhGwpdpOranpBfGH1z+8fL+ZQZ/4zejxMicR6cySfq
	+r6sHKXKnN7agns5niIC4xjpjONWkOfAsMiYqKMfliPwOXoRbbAV7w9At3uB/Vus
	427D+gGFDDbcofjwFNB6ce3Vd1GCzumfUG1OFkKTAflqDiel3dRJksLkMR0TVO6l
	LbElOOEr1FtIjMupAas510Jt5Plv53gAlcnLzXFyGIje1TwUxvTR8GWmH0oipLxU
	GEEiD/+VxcFy1r6aeWzPz51l6VRk42qg8b0iX9UTS/VRYY3/9FihFrDxaAowT2X7
	PudfSA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgh1x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 14:59:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99939c0007cso488153241.0
        for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841168; x=1795445968; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=UiuHRSJR7dp+m5X8HuBprtfXjqTMObM796vuw+JjtHBlA6sm9sNzm/NSn5gebq3FGQ
         u02QwtgvS3nNUlTr653d2H/guDx7sb8qr/cRAHBU1NzQkaQq7cLMGQS9lxx1rJonFsVy
         oeuUm5bZgnbS+ba/5gQWFTNdfMuu2CXfIbPlW3AUUz3vdRsESGf01axsTAHDJ0MqVq03
         l70y/IzanA55L4Rq5g4L4cknaZhuAaSMQQSwMRP3O7rARqEML5tbHLdmwb1rhXclsK8M
         xkskyXe78W+K89SdN/U+8m4T1vx2m0UH0WWhBUbM7vII+keoY+ckA3MGAxB5Gu97SiWk
         Obow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841168; x=1795445968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=xfE4Xit6EYmUf2Iq6hXJWUJ3WPUVaQ+TaCVs09AzU6lYXpib57XBh9TVsp7dJ3Cjp+
         GoZgUCiVg1DCrMvHPx394m1frxWOR6XbqcN/Vp+RKrKu+RSMM8KWSoqjDZ/G34rtrRlt
         1ny186pyBntLNyR6ZBM4Im555+wz0JwuV34aSvDGrbP0KMl8aO7VJ0SbfwEOHrC3Pz3G
         ORU0yWtdbV04uXSsIf1V5jD1X6khUVINROu/Pq2clwCNjaMx7oXIlkA/xl+fCuOrke80
         kqC7hlJDYxP2DYsM/tmf1EdkV1ZO9/DZ2lDV/D8iRT3kdz7A+0/Tcd4uLR2tqWKoenH5
         ynZA==
X-Forwarded-Encrypted: i=1; AL+hErGV1Kp6sP8fk72XS+srUEWAw7Ak9wSmj2NRK/gNgEVM3lBEBo8kQH2TDha28ifbWpfSK/L7+Hw=@lists.infradead.org
X-Gm-Message-State: APuU4Z9zWaOKQZ7ugs1bd+sO1eimqHODfhxlXV+BZ/1CcMz4ymuXz8tG
	yPUtFxzX/3eTMSYzq6bgwCLLmZHX/bIdm4NoUDthGACU4wvdUj6BQ2JvH4SgEhwM7XLw11aEZk/
	X8CYlb7bBESo5IzHeTrNAXBjq5tlg5RVkgPIKQMYkxZlRVbN+miUYIgFjYZ5l1ri0
X-Gm-Gg: AYBFou2L6wOjtO3oby5/Sbwe4UlMyksomo/XUQgAo5TUv6Qk9LzkOEno4ef3BGPV4cA
	uZw7I9Dc/LnpHiQlPi3OY7NmmfKknUHnmlCXwUbB/8R07lOjkUlMYqoQtbKAtptCKdrCJNFigSD
	1E0FqLG50nzEoogDYxFKOVE1a4nQnJ/TLm6eUxCaJVfke+ls9dmNEp37NIPngLDzYLJMv06KQFA
	5kshSO05/Q884wRMGv9kNPofaFEygvNam2DizmXBX2cb+hF2sU4GwxqDI9PFO4gy4DhZ3ZI4B3K
	dcKSAwIc5zK+f/2JBtvm+uF/RLPDLVqcbbEHskK3ABL25OY1xP9cruCFtMbsQqlYsplTabpQtQz
	QoXrxozLeuBmIFVaJpl7JtzaRPCOn+P4YRCUpXNGrPwh0+zSnP5SVe2zv/kliw3KpgWG5jZp8gy
	JUMSDzmyf7N6aIvg==
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834611137.37.1794841167908;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834597137.37.1794841167423;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v6 2/4] net: qrtr: Assign unique node id for
 MHI endpoints
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115882.1191469.10273528779891181170.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=1115;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=nmf5XJiuMoM64HRXGwco/c9sJpA0SyP6SEfhcFZLFYg=;
 b=9OoXP1d0ITEfI+QdrBZsHqRZY/6c+avW7cSbPIi5eC3sSr8f+QRUh5U44OWYLgl3pZpz1Hx0h
 R+wI4GlIC8pCAYQa37AkKg9OACfKCpEBiEpQp1ES8HeLcaWicxZn8P8
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXzoTSXGlGY5rc
 NHulaaGsXaIL4rrdViRGBRSmcrwzYJElLKpJxUIjJknVCwBLW5WfgkXBIgaX6s4iYnsSVP817cU
 z8ewMO1s+8XVLxclZS1qU2PtTj7B9/M=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb1a50 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XPvbEF_LEuHnWTr2ZGEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: UhVtH9fo71LD-cxyGpfb4UREgCQz8s_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXyBwmuGtrgnkC
 mjmIihKdlP//+05ircyuJwLQqX3eLJSPT31RpLMBQozbxYkZMUkR5pbXFA6o6QHWpR4WI7acMj7
 yCxiClvdgMxMuFXuOSVQ8oguWJ3+mPEkqmak+f6+GoE2VzlaDBaHNaJ13ncNfoWQIULRfETYaXF
 orjRnejfdd6RSVGBwhAcemVqhBphT+Tkk1Kcpp7AINwSTJjH/tu1sZOLtTQh5AD3X14r19Qzm9/
 KkklS7Y1rLIDpXi2smAXX/8Vq8aheiD4P5vUse6qjfCeRRhv2g5ky6eK04Hiz3saLn3CwEG/QUy
 B7MzkenNN6WOLYs29G33se9j8f4rsp1GuCCaUs9o8B2T1KB5OQwHnIPPl+PCuaeynMxb4mP5U9E
 hGGHctlTk+FYV3nvuo+QPpZF/bhu84onXzy7vlnnJyEG4eZ8rbM5rmwPQZc6trfbo8SyVMLAiFW
 qRkwM8A7288v5P0ellQ==
X-Proofpoint-GUID: UhVtH9fo71LD-cxyGpfb4UREgCQz8s_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_065929_535696_1EC596AF 
X-CRM114-Status: GOOD (  13.43  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 14 Nov 2026 06:26:14 -0800, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
> 
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE.
> The index comes from an allocator, so the host assigned ids are unique
> among themselves. The base is chosen just above the 16-bit range a v2
> header can express, so an endpoint using v2 can never claim an id in the
> host range. An endpoint using v1 can claim any 32-bit id, so a collision
> is possible, but unlikely as the firmware assigned node ids are either
> smaller than this base or in the range of 0x08e5ff85. Such a collision is
> caught when the id is added to the node lookup table.
> 
> [...]

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

