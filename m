Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6D606A33C
	for <ath11k@archiver.kernel.org>; Fri, 30 Oct 2026 22:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WMTHsowb;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FIor1cX/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrUCVs8A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vsBzW7xqQveqByDeByAFTWwNeMndMEtpm38WVOhX+aw=; b=WMTHsowbU7MG8P
	G13dC4tVloO+OKkDLz70c82U7BGxXzUHDREh3sk6lhmfl0IiSh+CF0gNTCt+Dq434ipp2QEaYnnPE
	YTXmb915VxYgUwcGC2RwGED5vyBd9aODlXIqdX3HLHMI7/FImeQD1xlKwnqnEn0FUjP7VyHDn2jsf
	oXQmaZ0b0mqCPhCzgO3B1cGRFDqboZGAwACuVf/xg7f5w5V1hWvQpZqdkmv7DlV3Jr1i72FlbkEvf
	1+KeruIHIDcLduJROVPIk8YJ20OXv0WBt9KC3Q6Z68l6DvR9Xm888oHcwgmUBfqhlWL9DTNAjoC8F
	NjQbBN6mWZyncaZY77KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvHs-0000000Cgn3-38ah;
	Fri, 30 Oct 2026 22:41:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvHo-0000000Cgl9-3BRl
	for ath11k@lists.infradead.org;
	Fri, 30 Oct 2026 22:41:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtQnP2926997
	for <ath11k@lists.infradead.org>; Fri, 30 Oct 2026 22:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vsBzW7xqQveqByDeByAFTWwNeMndMEtpm38WVOhX+aw=; b=FIor1cX/x4KrRYVr
	JMMahIwHkbazCSokigyudNhapGXQyhnD1JzmKQEF/LJvtvo6oUutN9cwkdX5ImI3
	yNf2fDFsfRYVFD3ft5GSwOg7QHx7T64tTFjXTsw8ClDGMgqkmyNJ0J8GtEx71PN6
	O8D2mtNtYIeM3KZlwZsPxrfJnCDmsFCYbi6oUaYh5G0mMrWU3hBRxVNxlL3GwGWF
	pOhfyQCdNrvqELMZOidIFH/EcTopRp264dv2eWMDMCxhdr81hjOORnEpo7hhFhGK
	Wd23iQWqTztJIcDfEjnP1nkpJB8s7o6qErV3XMcx85XxDmdFwnLlUnS/o2xrLWzH
	XnAZ+w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x187mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 30 Oct 2026 22:41:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so4883155eec.1
        for <ath11k@lists.infradead.org>; Fri, 30 Oct 2026 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793400083; x=1794004883; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsBzW7xqQveqByDeByAFTWwNeMndMEtpm38WVOhX+aw=;
        b=UrUCVs8AErpWIthQ9bmVKtiNAHwWJBa3bgSDY3inqKIQn5A+1aplCbF55GbHekNNkm
         Y7z94fkR59AKimMdDqjYZXbP9TLM4M8iq9AWyIG0baTlCVy2lxtV4VjJwWyt8WPaFwxY
         EnHZBBHXvdyIkXzDnYqNHQpYphn2X8Itah/gfnU0r+YjYLS4XLCtkXbFak1gMy08tMNg
         Lu6E/LbcG1kVHxNAV7iZo3VYqATv05Vg+6/sLrvbFrrWJIgcJfF4cri34dzzeL1f+OuV
         aXZQSVTIh2ObQTLbsH93ZwI6JDzecjpb1qn31PeCW0Csh3PRZrFopD2V7wE/7FNW9vKv
         krHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400083; x=1794004883;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsBzW7xqQveqByDeByAFTWwNeMndMEtpm38WVOhX+aw=;
        b=MHDDyKL4H9rl24A5QTdl7R1G2Kv5HjVZkf6EVoC1eoVlzdx4f9RnObzCxEGB9+PzKg
         XBL8HBOJEI3cqlXa5uO6A7u++5LA6e/n4lfxgGl1X+NRl82EkblIEhhqqpUsaqpWVMmU
         2zVFuJaYqo47+C2RBnd65fzQkfesVCgmX94uMA3IlIMgzFrbqIX3s/nSlgzjptcUeyRU
         W3zMCSekx22B2ssj5R4Q51SJBCpRryZ8M4MgVIOE45rNYCM+a+GooAavoyf/3TjbuPfl
         XGgHoYzVQxYLEClkaNeZVHVvBRA4HaidNVOPa67z6i1NPtISTxuNNgNc9FlLE1M6AOl3
         eJPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpzed9nLrAEEtXBrOmmTgIlyUKp4daKsmj9gmFcYHTC0cP3Nuojt7aly7b2N2F9zgkCEQ3CyI=@lists.infradead.org
X-Gm-Message-State: AFq9FYKLRTCVLOUHpuQqyJ35hpKS3/my2/dt46xoWFv8CMkmsbrRPq2V
	pvc2eAN4GgBKrOYda/FsxmnBguJb1lm4U6hS/AZKpoGOLBXJMkfz98hn9pOxDIUHcZmqki4gAiQ
	K60zqoGZxCWPF4sfJzOxLcyuZqwWqn7Q56cc4dzsZcCotVXEJxnZxfCGh+aM75EbV
X-Gm-Gg: AYBFou3gfcaT/giKjXTdHhjA8NsKzPNIVjzENBFa3Oq5RPyXYpvVmSYLoGsbyeH5sEa
	e78uLNYYfx1ebGUDqjq99lU7p4d82yCzTTd2nInnegOkG+qxYAJwuti4JbGqPH3sDknSUHeSka2
	iQCray7JqQnB22K6ksqrOcQnv39JE3yPQg0mwNTonBoyGWAsOXISmO2n+ZwATkhOdSSTnf8Eo9j
	kLACJ2bE1fVUWWKAOBFxP/i4MbkM86+wEgwOP7Q6T2+4ixy8vyh/UtteF0DyYAA3CRLjB1UYYRh
	yFPhRw6WII+88NxGAL0SHDXxOC7r3azFpD6gjZ8lzOFb26ZrFDMYinPN0aviawhr/Ee55cD4F7q
	pL83WhjCuMlLdz17WxL/dcwM0vTB3IW18sZV+J9tQrGuObIZtZEdC72GNS8EkqnPmx3E5CsXIbI
	eClXyVwEPzJPsFKvr6ZyqTCOITN4M=
X-Received: by 2002:a05:693c:6381:20b0:36a:1d6a:596b with SMTP id 5a478bee46e88-36a42412f55mr5914684eec.29.1793400083248;
        Fri, 30 Oct 2026 15:41:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6381:20b0:36a:1d6a:596b with SMTP id 5a478bee46e88-36a42412f55mr5914649eec.29.1793400082551;
        Fri, 30 Oct 2026 15:41:22 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm14002245eec.16.2026.10.30.15.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:41:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261024053838.3569557-1-rosenp@gmail.com>
References: <20261024053838.3569557-1-rosenp@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: don't select ATH_COMMON
Message-Id: <179340008113.1790611.5520153588822009643.b4-ty@b4>
Date: Fri, 30 Oct 2026 15:41:21 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: wZSmdMNovHqH99P5pT-KwqbOcqxldH7d
X-Proofpoint-ORIG-GUID: wZSmdMNovHqH99P5pT-KwqbOcqxldH7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX4K8F96jSp78L
 7U6lRXaDZScW2HtZkNyX3CdJdqs5oLMZL7HA+FY3qz1FNTfYl6J61Q9H4W38spWeByS5OLCYLzX
 aLIdahCbQqZ4tSlOf6iTbyU2DjFWRU0VFclwFcmT5w+XNwlDQOo9KkpSNxohr4prOz7tpBUqqqB
 yFzDmRcyLsIBPAfW7rciG8rn6Qts3Bk2WmBIdiqJ1wFUg4Rc4FFKgrUxl229fiIrJQ3h8yvcHax
 2xuzNhrz3CRa3Q1zejTxYjiZkayNL8Md/Qp3W8M8Oyob1EjMTSGcJKEpowE2gCMObwGeK9PCKVE
 g6+PbRxLN3r5cC11K9DChlAT01g9EQ+JAnyr7UKjoxnRHjAZLBbTEjf22E7OwnMWDX1jX+mnn8t
 cOtfcCsgO2ePpRyr+H8WKJ2ICPB1S0XMkp+eZxyu4XLwL4HsIje0AG0EtaEqUKsmwQCjXOb/Fy7
 lYmzTP+tPwN/+vU7qiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX4ytEKk/j0CCe
 cYNIHSPVmBYTo4LaFN66Uc8n5EHVs1od1IvPviJtAI3RXD5/QQug1qAUB1IUzMpJPktio/LGVQN
 sTtyaBJicRJ8MPKGe4coDS1Mz33vLzU=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae51d14 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sFLP4FgJ8RwY3w-QHdIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_154124_827637_F6B6BA87 
X-CRM114-Status: UNSURE (   9.14  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 23 Oct 2026 22:38:38 -0700, Rosen Penev wrote:
> ath11k only uses the header-only spectral_common.h and testmode_i.h
> from the shared ath directory and none of the symbols exported by
> ath.ko, the module does not depend on it. Selecting ATH_COMMON only
> builds ath.ko for nothing on systems without another Atheros driver,
> so drop it, like ath12k already does.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: don't select ATH_COMMON
      commit: 70f43c2c73df0e769995990a7b330ee56f0e1fdd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


