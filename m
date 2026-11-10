Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552860A3830
	for <ath11k@archiver.kernel.org>; Tue, 10 Nov 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WboLRZOS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7XBpB57;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DgsdKo+T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=; b=WboLRZOSVSM7kY
	ikyiEXswYMdC0EmTulgRzyuTGQf11eut/26XUAzFXQTB4P5gs9ICPsGIfA11NsvbWBIK0/cH5IfaZ
	JwsEXonXyJKcxK27Oy8M3nq/GEbvgdQw1aGZ80nmd4NLc5IArnuTyh4A91I7vS0D4vrHO+rxDSfXh
	nLoh4DLaiwxmvmQ6uQKqMNF5uq39tvpYHDiU6Uw00n0sEq8xnT4izpbyqWmT2vF3PySuwAW1849TO
	I718hAgm6DWxkLWV4hEa6F2R37OXgOKd2Eqi60/QC6iWdEV8BY0ofm7QlBER8JUmVpmVHSeB7xPTl
	4ijW4XETlgfUpvpx65qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmi9-00000004Aro-0lWe;
	Tue, 10 Nov 2026 14:20:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmi6-00000004Ar1-3pBF
	for ath11k@lists.infradead.org;
	Tue, 10 Nov 2026 14:20:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA2643228633
	for <ath11k@lists.infradead.org>; Tue, 10 Nov 2026 14:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=; b=l7XBpB57foeSGerC
	m5xXsz9xfKW3IDra2zZuwsxdvJkaQ+sMPB3p8LCrhBZTcHvBCSCwRuaGMNY4MCEh
	NyeVGcW1zNS2v/CIMe1i+iuwtlC6KRZgc1a9+WDr+CeB7Aw6+xBkdi6tB8YN3Uhz
	8UsZStqrHjrDSMX3kSDwEVqZSQ2pjvPynMWFSW/vpRtXRMldcfC/wwVEtMjQ0VBR
	WpGANWEThWa5E1yEJguRtPxpNoRUuCUNeVDiUOFyFnsyNWXZoiIn3MO+tjXoB9vQ
	8Vt+wOJxBnrVmVJtiCDnzJRDahla2Dy92Lt95CkpEBRgpKEtZgRO2CfRizsfEdSv
	yTxC0w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d9bmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Nov 2026 14:20:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9907539aff7so1518650241.2
        for <ath11k@lists.infradead.org>; Tue, 10 Nov 2026 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794320429; x=1794925229; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
        b=DgsdKo+TL28fwAZjiI/p1iYBH6jFbCUIxF9tweal1TLrmm2Efef/99NwN/MNhNkNjN
         5BA9wRzgOkdQ5MdGGmUPTtJ8Ee+SyI6ykVMjcxXYhSfkdGXI2PHQ7LZ7Ae2ILN67s7es
         TxzM2mEmH6N7IwXlgc8Wtnz/gWPoUZxS2ZJm3d+5dnls0+35DFTm+UX9ZrygbHyCi4HV
         L91iqqIjo8eNxGPuIYUwrACzYDupT186Y7GEecavS0rA9w/0cQbVBo2SPbyogMH8NuyM
         j+K8js9Tq5wwpNDNaF4hp4zII+XnMBVjDGE2wBqvIOCv5L/bEDXjmXyjTJ3TWLcgyUFM
         mPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320429; x=1794925229;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
        b=tR5I6TMUDn7ndDiBvuNvHWGCoX20pUsH6KZB/t+CrqJKrt/zyn0PPz0rwGw8Nqekoi
         2KAjkr4vwSSGqXttnH+BqMM+CFVX17SGP672vHIxBAKskDad1ZIzo5cipqKwnk0hgyGz
         f/GQ7SNg6EL5QIsP63LFAM4/BOPxJT3wb8b8U7PPBlZlfQ6T3WctJkS4pn1vlE3nC41y
         evAD6aJLMfXRrI0bIjPzNxGMRP3PNIlgrPnybDSxkdW9VA8IO0Gx845vtzrjeK50v/Yf
         E16eu9qzxf46lMiNJk+KJH02VeDmyWdGDYaIC5MoTMHapqx+aQ2U3IeGB0iFVFbOtrX8
         FLjQ==
X-Forwarded-Encrypted: i=1; AL+hErFdq0ag2X70xIlLGJXN9Ijce0uPvu3fQGrxxUCmkZAfgOf+ciJ7ZiBIPOzAr4DkxN54YEQb6M0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8/4ISeitS9zCzYXDOik7Vm6+NIV6LofIk5sHaLG21B9kPKbvZO
	duC2waJH9GuYOvOzkkMQmkF7u6gZdop4iTC0+/EuC3Zb13CR3X3TVfFM8MYwLz7ygFFrXg07umb
	5djb5+aBR1difJcpYV5qnME12fmGwjKiMTiTxb0W5Dlsnz+f10huEJeYRawBHB87g
X-Gm-Gg: AYBFou1xr1u1GuVf9ytC5J51oZlEVgA9gE2Aavz31tfndJNABov7BtSvui+qMEiAwt1
	Gvpm1VM+ELGR/Gg85fVEmPns6XBgOXi+qXgUDwtJGBQvcsBF2CXc8mkX8ZUx5oZC19xw4/v0vUQ
	Q5zDSqn263MQrqvZdLd7Pvm4mRdRa+Xvy0JlnYwZlfJ3y9irWE03/f2OMAuRNp//HROHhgpTRgh
	VaFN9S9LE4dF13V1dUYTxlRXlOHw+zaAndXqeAKVLTObCmeUk6uoNC4BbUiWplQDO0sICYocdMB
	0pZfm/KqjdO0Q6TMPMMkeqwQ642XiBFbUYAoynA6rNlB6xazvFaXvMxHmcbpm1GEuj6DxkG7kcA
	P1EJ+enaQMLrdjXQ9r+TXFAcVf60JtbfzLK9cOatU1M2mcqr4p4+O7MILf09tKv0MzvvftOyblu
	Kj5a0fgTduvEA58A==
X-Received: by 2002:a05:6102:e14:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d301b90875mr1015842137.12.1794320428754;
        Tue, 10 Nov 2026 06:20:28 -0800 (PST)
X-Received: by 2002:a05:6102:e14:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d301b90875mr1015820137.12.1794320428242;
        Tue, 10 Nov 2026 06:20:28 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm5242319f8f.44.2026.11.10.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:20:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v5 2/4] net: qrtr: Assign unique node id for
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
In-Reply-To: <20261104-qrtr-multi-ep-v5-2-4cdb2b4f1920@oss.qualcomm.com>
References: <20261104-qrtr-multi-ep-v5-0-4cdb2b4f1920@oss.qualcomm.com>
 <20261104-qrtr-multi-ep-v5-2-4cdb2b4f1920@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:20:23 +0100
Message-Id: <179432042357.601816.13272349217674070278.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794320425; l=1427;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=pmxqB3moG63ZiXPlatXfrHmi22c4brr8zAmv5UPA8I8=;
 b=3VK4IzgRzDq5+i8kNkOpzL1wcBaSJdMg4/naLLQ7vN/3KPtJH+B1yfG8lIp5w3xiAoLLoYDt3
 ZVuSV7r+yx/CX6B9QgIG7xJ7bIfu+nOZyq4a/C/87nhN4u704Cmn9aw
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-GUID: EJ-mK8fM7kD6ch2odTqkHPwMuq7x_fV_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfX3gTrTeMI05Es
 CkJzU38eF6n9nT83UHHvoQm+t1z+RG0OXNO1NAWAD06eaqRJPscvRKhYGRvrZKIrv4g4nAN7b7g
 SsBHUJqBXbSnjuk6YSsAPC8OjV+dIyo=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af3282e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=51d02FP0LlRxlB9DzpEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: EJ-mK8fM7kD6ch2odTqkHPwMuq7x_fV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfXyeiOG0J3KXGi
 CoN+agXa9RJ4GT+7zLqcZ6V7Wy+TPLrRiPBycMmN8opIA3dJD+bkPb9LR7gHQfeH5VEHFX61sS4
 /Q6KWuMZBC1Qj2etWdVHUZFNPwbPYLPDqOgMO5VpymkiMzxMKiRyCefJAg7deNciljwz9vtPYO9
 tQ6G1CQmtK/W7CWFIjW+tN1X98iZZ02aAJOCB8Fp6rIvEpLmLzMVlzgxV19sWvBHSK7YKdKvhZY
 d+IVszs50doU3doXwj/HnkEmeQVwoqVwhsnOUJgWAyyc7+mMIABHBEAp8CKN5AH6xszzme+ycF1
 2BMm7YjBbWMujyc/2OUZOgU1GWNuzoLFzh1QV5rIWeOslNCIU8nimf7St772hZOiw7svA7wx0nw
 uOZ9t+4WXE9NMjh9GhzIjZrixyNMMqzN2tGtovL8xymXx3zy/2eNp269PFh2RDRfsAevma//0H9
 WsE50TH3pqAPxLlVZCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_062030_958269_6DD10BD6 
X-CRM114-Status: GOOD (  16.13  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index efa70b95f8a7..7a59ccf15490 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -11,6 +11,7 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> +#include <net/qrtr.h>
>  #include <net/sock.h>
>  
>  #include "qrtr.h"
> @@ -590,6 +591,12 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  	    cb->type != QRTR_TYPE_RESUME_TX)
>  		goto err;
>  
> +	/* Host assigned node ids are not supposed to overlap with
> +	 * remote node ids
> +	 */
> +	if (cb->src_node >= QRTR_NODE_HOST_BASE)
> +		goto err;
> +
This breaks the functionality for QAIC devices, and any V1 packet with
nid >= 0x10000, for two reasons:
 - V1 uses 32-bit node IDs
 - QAIC devices use hw_sernum as the node ID. I am yet to see a device
   with node ID < 0x10000
This causes "invalid ipcrouter packet" error logs to be printed when the
device is advertising its services to the host.
>  	skb_put_data(skb, data + hdrlen, size);
>  
>  	nid = cb->src_node;
> @@ -615,6 +622,8 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
>  
>  		nid = le32_to_cpu(pkt->server.node);
> +		if (nid >= QRTR_NODE_HOST_BASE)
> +			goto err;
Same concern as above.

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

