Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAAE606A880
	for <ath11k@archiver.kernel.org>; Mon, 16 Nov 2026 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rV9nN+Hi;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOLB7abM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FmdhLTWG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=; b=rV9nN+HiQpvlX5
	hR+Kfl/1ZqNGJtUrfcS0LwT+qc4SXBBk6WHuNWmnVsYs0PO5bxT9DpT3J6R8FvSnwk+ROSNbHBboG
	3I1D5I8Tqh/n4I8VovJN38IrARGPGQLQEb/StQgnoKMgu2mjRsc4r/50OoritaGLvWGxQj/v/4Tr9
	VT3Plw/L2Ql/rcV5tzSOzjrHKFgFBXuZnI7WrkcieXtKjOnUe3Mf88YqaN1L44lqDaX0Amms6Bqva
	TE2XC/aZeVqFz19AxVLzMaz+W/FD1HP5XXq1ejfwgB7kT1kvmbeKFbI6b/NUzAlPHsbVoWa5Ak/76
	NZKV3E5T9o1TdZorlFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyB8-00000002xgo-3u8R;
	Mon, 16 Nov 2026 14:59:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyB6-00000002xfR-3Oa5
	for ath11k@lists.infradead.org;
	Mon, 16 Nov 2026 14:59:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrqRn1249865
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 14:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=; b=bOLB7abM4jkAfiKf
	yGiF+Cx5NxsP0yPKDepANS4vsPwZqW0hSOkhqfTAlydmEeeOTeOEIHWXYj/B3NZ1
	7xT4h4Jhv2TX+aW2ZLtXc+G8Q4prBJ2v29xIv+pEXWiVOKkAa11Gy0Q2d6POvW68
	pcvWKiYCyT2wry47Pc9qetrNxT6RHvB3NIb/wvX9vSy4Qg6aIRsnlTrAcXhmqhhX
	+RZm1LEkiVlgBDRABJcHRnJQrXac/8XGrOzMfuiMl/MIdkNqS3jN25IZKcF5pJcO
	pwEtMimM2GvoZTNaInvy58ZD31B7lTDWtBa8Gp3SUMMxgXfGNdV64J8rn48YGFli
	spjZzg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0yr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 14:59:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b206156cc6so1182740137.1
        for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841167; x=1795445967; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=FmdhLTWGPLa7FgQlVZlfTmEX/6IXHUPctpkKP4BNr8Vyj85Is0rVUuQueyHybLA9R1
         5aP83YmmnfehlQZtkVElLjuFn5IJ8IYv2YU2ZVktGXGYM8Yaa2F1qscyH5lJLwxU0XzZ
         p9GO6Q0H8uoDXCrsytC+MIXgnDatW8VDidXlQkeVZ77ZP9Wy9mfaX17zjqIslYVnJ7B1
         irYIAzgEkj4tXG23Pqb++4l60hJ7kY7Di/oaDr6inbx1hiRPIEiFbnAqAJzuNPi3MLCO
         E0WPHIGL3tJVLQxXjf8HYIdiVpgAYusqtZOaZFVvVJ+RLYfXYv1ET30KhazVBAsBkyE9
         QKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841167; x=1795445967;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=0IkNFPxALJYK/MUqhHWZ47tL0kmIDCFq5ayd0wGw2MP/d/yYjePeskMwsVfu09WrcM
         xIovztFRNJg3mS/kYDd3PG/BHrWWI+CB74KsFILspRCUjNl3agybVmUgs8FKFE2SLVRV
         xuid8pUkSXQnrSGV6CSNHDTIgS4zpSV1Z3nsCtXggsxh0lHpWJDqe0sPDOCm/BLA6+HI
         T3SxlNgPGY0VVfUVdrbQs+eSJ2SD6oxeBatYIhfFw8c+nDgHK6R/9+wrcU5orw+G5u7Q
         3tvw93tEH67lpprjLppi0lJ1vntT04AfnncMFqLSmN5xdDmREemRce6vntKVYUuooDH5
         WNug==
X-Forwarded-Encrypted: i=1; AL+hErH1nfwe6IRPCvvVGl1VIcKXGRLTvMGRpm+oT2z4XVs9WVIq+6TpXCYHGjHvYmL5baNkAC8LJEA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9+U0P/7AHZ9uviRlYNOZfx9g/a8ziMkVwLt/0ZGkVsk/Z5ZjZ0
	EXurcRHq2W5MJKveFldMy5X6y9S0b+sDUAfUcTmPa4aV6tAvCsp7y/NJFU4enkdwyU9dr51YyeE
	a2BceXZMb0l5TYih7g7Yp7ratlMwWThfmvXMwPS5clAid/w/KkImChCeMzqsIYlK5
X-Gm-Gg: AYBFou3weZluiYEd8wB8DNBETozXYDFvjvvyXhHb1PiTZ5rlQTZMTtlwHygfBvJRa5D
	LFBpWCW80NP8OjFoQ92oqDp0aVgRoYVAJesEwe+306xusbNMzXw2W0JUMncmniXbOszInItHONG
	U4W5VCIwj3kzw/7l8WxuKN7YxuQSVSAzohnE9yxYMROlhFy0VvlLyETmZlSUPaXetJ2XDKCWwuL
	U7r6waSaF1gJpoBv3wPDXNkPQNu0J0zNMgLUrKZo6H2fQkgwcBBceBumhslm6MSO3cv9I8zrjly
	3O5G6f6BwO6Ziobu/5HcFXuMzVwALkt0oH7N2WjMmAfsQajBt1uTrDa/yuD9uwh9UNeVP2VDtd3
	/WpYWdUmIfbN8M70V/rH8Hl7cUzYufkTU+uXzOiOFNNML/1dOqcJJ471YMZwKWktu4mIMr06Gyo
	zcfELvNbwhHvM+Pg==
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604768137.30.1794841166350;
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604763137.30.1794841165909;
        Mon, 16 Nov 2026 06:59:25 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to
 assign a unique node id
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
In-Reply-To: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115880.1191469.6312889000780599157.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=2289;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=tfSyqr/JVICb+gJ8r7i4p9ZH7pgvqyq8dvPpEHT6sQM=;
 b=kD/xci+qoKdonWMirYRCjPRULCCHqoSo3t+/4LvbeHgPxyp3K1S2tDB5PInEh8mC6gkvdMqN/
 gYgFqDd2UsiDqfjgXDQNm4LLbrHrVFLoTUJYNFudBj58U9gOKZBgCZa
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX6/tWhCh1GVZz
 sXLaZTIS+fco3Hpps7OJLZaSagjaAwLD76d01GR0oilvnEosm1Ay+5v5dn0Ugo4Xx62C4oOtw3Z
 kTW5rknTCnuAfaTBNiHSBDQF3aLs55Fh4OMLUH28VR+vADHfmFay3VV6BbykbltJZJTHF9nnA5J
 TsHFeElxbd0qA+trGpa4AKVgJyR4LSZ+JuRspIBmEF3E5gPGFdSIvk1R1Nc6yoIvo6bkxs5LbA2
 l08o4EdjZ9oxFqatqq88PcA2ArHB2FWV1F9Gk5vG8qw60KLUoWFLObqM0Tm4Tsbt0DFxRvD4JIl
 CAUJpVzcSYesPCnLPvBZLB3DEQi2KFQdpX57DLbn4iBU4+SKzdRr4sJT8BaI18f9J2WaVShapYX
 Wp1GkHbbvLx17oTnC4xxWUo3uJYOP7KefRtchTVzirwoR2ljj/5aEIDLs1UJGme3Fw+wKz4LXSD
 SD3csXRMLygW0x9dGnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX1tzubZ+PglQq
 UGZarOjAmC0mSsHmWU7J4xgApEw6uD9Yet6j3Mh+wUlKxzRn8eMymtoPDwXlvhvlrYDJMsB37/S
 OGCxezAE6MAtbz5pCNBYCP1y0rp+Exo=
X-Proofpoint-GUID: mvUUQg_FaHTewQjzynIKK112zpDfZcnX
X-Proofpoint-ORIG-GUID: mvUUQg_FaHTewQjzynIKK112zpDfZcnX
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb1a50 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-dTT1UR66QJk1rbgP68A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_065928_856785_AF5B2A90 
X-CRM114-Status: GOOD (  21.30  )
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

> Currently, QRTR identifies each remote node by the value of the
> 'src_node_id' field in the received packet and uses the node id as the key
> to store the node to the internal 'qrtr_nodes' radix tree.
> 
> But this approach comes with a limitation. When more than one remote node
> share the same id, then QRTR can only add the first node to the radix tree
> and has to drop the successive nodes with the same node id as the 'key' in
> radix tree has to be unique. This prevents connecting identical Qcom PCIe
> WLAN devices to a single host at the same time.
> 
> To fix this limitation, allow the host QRTR to use the node id (nid)
> received from the endpoint driver during qrtr_endpoint_register() as the
> unique node id and use it as the 'key' for the internal radix tree. Also,
> store the received 'src_id' in a new 'qrtr_node->ep_nid' field and replace
> the 'ep_nid' with the unique 'nid' in the QRTR control packets if both
> differ i.e., an endpoint driver has passed a unique 'nid' during
> qrtr_endpoint_register(). To maintain symmetry, replace the 'nid' with the
> 'ep_nid' while sending the packet back to the remote node if both differ.
> 
> A node can also bridge other distant nodes, so the source id of an
> incoming packet is not always the id the endpoint advertises for itself.
> Keep adding such ids to the radix tree as additional keys for the same
> node, as it was done before this change. Otherwise the bridged nodes would
> lose their route and qrtr_sendmsg() would start failing with -ECONNRESET
> for them.
> 
> Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the 'nid'
> during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same and the
> routing behavior is not changed.
> 
> Finally, since qrtr_node_rewrite_ctrl() dereferences the control packet for
> DEL_SERVER and DEL_CLIENT as well, extend the existing length check in
> qrtr_endpoint_post() to cover both types.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

