Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766D9C982D8
	for <ath11k@archiver.kernel.org>; Fri, 18 Sep 2026 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlrqp6hzEyvS2JuXrzVg/2ASZasMwkiKMUs6oP7YPjU=; b=JEt2yGQMU1h09Go2Ojg142Q0W8
	LIdPviL93dbx0wuhMy+BssdYOsrWacBiiAb9gYAEh4jMW66rMsjyUvnN2NwpMLu0uBfWG9LJGpg6p
	z88S1tGuJcv4OJyE2c2o4gQT2Pqf5/r3JD9+siTcc7iAezvEMtiFmXgkeKfx7vPSXMdgDqxgY/8Cq
	mtWOWZobnyZsvSqQE/l01BARorSCSaeK9LpM32x6i7deHBBEPpyzIC/9z8KoB2VNHVKHum20JWDkh
	9YqzAej3QipptGCARFrKoCSPzd9ScqxQieVQX5dY7LjjJdElx5km6bdkACH+ckSeKLotXPoD5nGi4
	gF2GXh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7d5p-0000000FGK6-3GTj;
	Fri, 18 Sep 2026 18:13:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7d5n-0000000FGJH-0mkh
	for ath11k@lists.infradead.org;
	Fri, 18 Sep 2026 18:13:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGo6mS508582
	for <ath11k@lists.infradead.org>; Fri, 18 Sep 2026 18:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlrqp6hzEyvS2JuXrzVg/2ASZasMwkiKMUs6oP7YPjU=; b=QnSiSkrBsQffLT2m
	/WdGxKrll1bdiyVF5lVP37RUWAP1kVlS37YajVydWd+bTWHY6SP/0NFwUhDO3ZtV
	6MySMjpuVY0RQ2x4J5kye9lloYTC3mXXc6vvo3X0jOSro38GWRDRcsh8RpdMQ7f8
	wrNG+VRzNNNH5fLuQleWYapmnEAalGWb1GK/KXXOiNBrfQ9hUzLprhbZlNR+IUmN
	TIO2uA3b5iLJHP+LR8RBcPKra+YAIWPs6LpaXgIOERPuhUUce1tQ5KVY7wvGd/l0
	lnnY6vzkGGO1jB4EYQShfL3YJvlnTT+FV0fDMJZsaCFrmL7ozjCRRNkiWO532YSX
	fBGxlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs84a0q7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 18 Sep 2026 18:13:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1845446a91.0
        for <ath11k@lists.infradead.org>; Fri, 18 Sep 2026 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789755226; x=1790360026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlrqp6hzEyvS2JuXrzVg/2ASZasMwkiKMUs6oP7YPjU=;
        b=B4SSC11gbcERh5GGM19ZHBfvzoJKL3IjSlcwGZRagzBCOtjt97PwUKinmflC3TKR71
         A0kfye29GlkZ6qG2vuemJMsTjPBWbllZiDnv4mj58Lv32NTobM/ZHTFLpu3CahFtPieK
         YhHpkgmyBL5idA3qrHKwISaxFTGYPHrimzHqUIoWmRNO3f1yHHE4Jpxx3sCZh3Kfj8F+
         Ys6mJYZ98l8T0BjwTcUT+88OKQBFlmkEW+t9TCYcTgxX0Bag3ohht9IPLiMbCT9n4V4x
         vDvN85TCS/ebEuFHS/uy87SQXEtCg2ImQCuV3b5uPImBhieE21G5GqyaglSxRLxttJ7S
         JA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755226; x=1790360026;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlrqp6hzEyvS2JuXrzVg/2ASZasMwkiKMUs6oP7YPjU=;
        b=V9rGf48cCKDtVWhxuYkXfcAbibAlLOleYev1vuPPvqqqeiP5X0BOyyiSwr30IYMest
         jTJpEtorwW1mc2ELUJ8eeeNYxrHWjJuENrzzOMWubB6ue1eaV90JVyExF20CgE+cKG2+
         8ThkSemBtlsNyabpLl0PsRnddeNLbVZcL0o7Em/9HR5kSfXBmwgkjVp17AcuiEZEYBTw
         4OxsQj5Cz//yiQGpQRMspYbJaJb2ov0U08mRhSeUTYyek2Dzwq8gfGsCv/G0CKm3OsBE
         cwEinIbS0rsIqhflwIEHE9W8Lx+LXYHzV1N9tfnXuIfJqzxiqDGtXkk4sy+7xOViLLWm
         Gi0g==
X-Forwarded-Encrypted: i=1; AKwUvByjMzPX+TdWAcBTDsla+ZNFLt96R1KTcxRsDjWrXegV/kaz0NsjuOkadkSoSC1e8uoIO1Nlofc=@lists.infradead.org
X-Gm-Message-State: AFuF++loOpmA9Lu8ZTX+Y5sQ3cBcihcmWRK/aqDK8nnYrxfOIOzJ6lmE
	it++/Y5pbscFIr3+RS9Jaz4zhW4Mtx5PzEhCEMOA5KAz7p8zfJBCE5RmbBV+u8Hz4J+6LsPaDA3
	oAQ7mmiUfGYCMCyPd037dscmG9OVojou5FFb+CBgTBzCDOBXbfphvV7DDuQQTy8lj
X-Gm-Gg: AYBFou30u6+8AdwtCiAhhr7LtbMkIsP92G57YX84uXBf5yGT/0q1wiDmBuk4iovcK3a
	WLQl2DcodCzZr/vjP/QHklkuvKWk3aGi2foIGVprgVHwvTLHPVD/pjNiAzbNwtDRHkHGrDfJ66P
	yyA9F7Uy4SWR8nGsSRcMZH1xd06qWJAiQdBABiBjISHlpW30Zz938i+JOoVv2poQoayxVKsfvw9
	5iUEbeU9BAc4Ajsf/0oSrycCHIIf5+W96s1RcqPd73201qbmihtSGq6hFKZ+Wjqxr+mg6T13Zg9
	FTGrSoBWybcZ1zUdyz0wkQB08K4tXuA6RuqLGCfiWYQSHGlgLVn68n3FpkO9yRh6AlaGb943gJ5
	VQMXNXmpDgTbQRYTorA7C5frlEFh8+fFp9PJUKKFeDpD4kN6dyytb/vpVYQ==
X-Received: by 2002:a17:90b:134f:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e54d3651cmr7028582a91.22.1789755225604;
        Fri, 18 Sep 2026 11:13:45 -0700 (PDT)
X-Received: by 2002:a17:90b:134f:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e54d3651cmr7028536a91.22.1789755225051;
        Fri, 18 Sep 2026 11:13:45 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331433besm467963eec.16.2026.09.18.11.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 11:13:44 -0700 (PDT)
Message-ID: <4e0481c1-9288-42d4-94c9-e18da5cf8e5d@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:13:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
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
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cWU-gTIvmi3GMS_WJrhj0tBUiSDhdeBc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI2MSBTYWx0ZWRfX326KCu3SA2Iv
 ZBan1VRqi6LL6Q1qP577HvJUcLr31NGTsCHgy6DQ7u3LNKFtXOpxCbFzr72OFpvpmhM51jZ5mAi
 Pp/kQQILKAXWKKIJeb9c3cGqi3vPI+Q=
X-Proofpoint-ORIG-GUID: cWU-gTIvmi3GMS_WJrhj0tBUiSDhdeBc
X-Authority-Analysis: v=2.4 cv=MLD1C8Zl c=1 sm=1 tr=0 ts=6aad7f5a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KAMPhC-K3bquQAzTacoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI2MSBTYWx0ZWRfX2p881DsYWFA/
 jrb5t2RjTrXRx+nWKRBdp2gW7p7j3FqArTM2HsBxBiC3zp7sbrDuvVG8fMq5st5CfQFGlon7114
 wodeN+MoJHBe+AEzqnRBAq/RlFnBSh00P7VZFROSgIbcAOWC8HkzNr7HIQeBT9HKGWQsJfZ3+zn
 nMbLI7scqmmzEbVoyLUmniy2me0NGizKo49RpnQkh2lhecjg/JwrKlzjReeeLCRpNVNr4uW1BMV
 Jyi8e+l6DPiWUWf4NC40DkO/yn89D0E31XuEvkgty3TSzNL+5DglkfDsCdKgai+gfWw1lp3yTeM
 JPzctRbTAXmKLNKAQHaBioZF7FmtOt7QXySHQ9PPmo/mVzQ2coqkEoD/QnjplE2woYLwnurlafF
 8uviMzkriXiz8xDGgjd01RPXYyeAvXxwz0kjBRh54Ga6Il4aaWuNOTK6KvT+HvlCpwim4B8Ass0
 HAR7OYaWvGYt3ZebjgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_111347_244965_3117E122 
X-CRM114-Status: GOOD (  24.49  )
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

On 9/18/2026 9:28 AM, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series reworks the QRTR driver to add support for using identical MHI
> endpoint devices at the same time. Currently, QRTR driver has a limitation on
> using more than one identical MHI endpoint devices like QCS6490 or any Qcom
> Endpoint device making use of QRTR at the same time. Because of the fact that
> these devices will have the identical QRTR node id, they cannot be used at the
> same time, on the same host machine.
> 
> This limitation is a blocker for running upstream kernel on devices like Qcom
> based routers as they often have multiple identical WLAN Endpoint devices
> connected to the Router SoC.
> 
> This series supersedes the following 2 series from Juha:
> https://lore.kernel.org/all/20260915054207.2513877-1-juha-matti.tilli@iki.fi
> https://lore.kernel.org/all/20260915074135.2567411-1-juha-matti.tilli@iki.fi
> 
> Compared to the series from Juha, this series simplifies the multi-endpoint
> support by computing a unique node id for each MHI endpoint and uses it for the
> internal QRTR book keeping. This ensures that even if the MHI endpoint devices
> have same node ids, the host QRTR will always use a unique node id for each one
> of them.
> 
> More details can be found in the individual patches.
> 
> Testing
> =======
> 
> Juha tested this series on multi ath11k setup by backporting this series to
> 6.6.156 kernel. I'd appreciate a formal tested-by tag from Juha and other folks
> CCed to this series.
> 
> Merge Strategy
> ==============
> 
> Since both QRTR and ath drivers are falling under the networking tree, the whole
> series can be merged through netdev tree.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Manivannan Sadhasivam (4):
>       net: qrtr: Allow the host QRTR to assign a unique node id
>       net: qrtr: Assign unique node id for MHI endpoints
>       wifi: ath11k: Connect to the QMI server belonging to the device owned by this driver
>       wifi: ath12k: Connect to the QMI server belonging to the device owned by this driver
> 
>  MAINTAINERS                           |  1 +
>  drivers/net/wireless/ath/ath11k/hif.h |  9 ++++++
>  drivers/net/wireless/ath/ath11k/pci.c |  9 ++++++
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++
>  drivers/net/wireless/ath/ath12k/hif.h |  9 ++++++
>  drivers/net/wireless/ath/ath12k/pci.c |  9 ++++++
>  drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++
>  include/net/qrtr.h                    | 21 ++++++++++++
>  net/qrtr/af_qrtr.c                    | 61 +++++++++++++++++++++++++++++++----
>  net/qrtr/mhi.c                        |  4 ++-
>  10 files changed, 136 insertions(+), 8 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

I see this is based upon v7.3-rc1 (current release tree).
This series doesn't cleanly apply on the net-next tree.

Are you planning on netdev taking this through current or next?

And an alternate merge strategy would be for netdev to take the first two
patches and then after wireless fast-forwards and ath fast-forwards, I could
take the last two though the ath tree.


