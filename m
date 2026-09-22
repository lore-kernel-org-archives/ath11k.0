Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3AEC98302
	for <ath11k@archiver.kernel.org>; Tue, 22 Sep 2026 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=; b=15SD4iaYMs/PGLoKvAu7N1FSpn
	VnLAccq9DWTE/T0cdGZxuNOifVdSrQA2nTpcRqd0adCMDQ5JNX2xEuUDpMHvijua3XP+wF2chzXmW
	YY9yHgKiFJ0nZGNkjVLgaAszweWK7e49E3SL+CsrEv42YVVzxgNmCT6frtrbjnbDWcJUcvvIBn7Rz
	GYnhZU7DBPkF0ZeoPM9rjGT86I4z5o1NDb87Q8PNAnwyGG2DuWVx7FKY9+nawacaJamczUU8RUCoD
	JLf4Shga6a9nTAtxX7P5EegFiwq4QXZIxfeNC5mH2ZVeYDlqS8r35Q4eRnj9snjlkiQXBfJUITnC6
	FoGV+yJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93yk-000000069YO-25YT;
	Tue, 22 Sep 2026 17:08:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93yh-000000069XL-3idt
	for ath11k@lists.infradead.org;
	Tue, 22 Sep 2026 17:08:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjVib1058317
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 17:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=; b=Svvt2SmY3+ymXzIc
	CWQFf9FtmUpvg7wLbV3aChiv1BvdzWYKR/XATRtCRlgqY2s232oIzC2ikWZSnQXu
	vKmpSVO+G+nqMkEI7Qt5YfXiDjx+htW+pI164UPoJdMlFp3uP0aLazcfg0XJhp7w
	gwPTVTV8fOUliKjD0nluzlof3bxyI6pEtCzXziTVhi4N3kf6Oi0E2dXu7Zon96Os
	ZVDi5Y6Y5T+LYGee5fJ0vyUlGU6kCeTfIQCLO/hTzJUFMgKkvsIthosPABrg3MK4
	8e6z3f8/giPGT/MNioYR4oltQpimlJdnMNmZa/7pbfyFqtxo0UAC9ovG0zBojsOe
	EJChxw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5ukrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 17:08:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7915a83539fso21586137.1
        for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096895; x=1790701695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=;
        b=bNS3UdHVoO6Nm2FWTaLVM0YTOYhswJVIlFPpnpzaIdw53dQ5UASR+7Oip+Xeko6jjh
         O5KgLGY3xR9JvC06zTckLmUj28Pi0PcvJ0tAoIOxRzhYiRiEZtQm8DuTJ2Y8Zq+2MfVr
         bvp8kLEMPBZkvKisJwaPmklqlRNNj4lGFXEDOBevrpGuMqFCfb7u/aHnVyE/KviH0xbi
         W/4aHoez8TE+06wNCQStN/HGke9gsXQYBECRv32pieJrHlf6AkyL5cx7GGk6zoRvD6cV
         SdA6+Yx6hDVzxqUeAxvepFCJZf0Lc1sQ2pOjvhtWe2v5iyzU0+M2AqTKttF/VtNhcx90
         IcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096895; x=1790701695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8oRSt+sEOboeNFCv168cePKrrWr+FqZQJjlgNOUwk0=;
        b=xZ/ratEjznm0V5Kz9rHqt6024RpGXpxMFvKPPnDNl5GR64v3mSPJcxA01iOQGct6A1
         6dMwkAuH95mjG7xAJdEVr4McDeMsGYdufzPptda7atCNibLT41UC2R+3Q+IUCsxHRpmK
         fm/eTzyjGLAFe0GRIen3dTyPYGVzZNDfhgVD/VDOIkx1skDOtNct/0DNxdvTrV3cuMva
         fAwUt4kJN5c7WU+Qrem/7Q0YzEBi5IA/zGIiwCG8lX/X6GsBeBu7tI6SuvZ3gPmwr1RR
         2m2CFgjYQVQK6AlSlsPmFtnjehTyEb53Qy9k3AdDbu/cBVXgS87BK7YUcJunhR2d+9OH
         FfKQ==
X-Forwarded-Encrypted: i=1; AKwUvByZMuOiMg1pWmqHW6iGQSy973+PmGJLamsdRWAAgppq8Li3BA0n3Y7IZ+y7agz/+ealsL0FJE8=@lists.infradead.org
X-Gm-Message-State: AFuF++lWgouhOQb4v6QZKfSTsVZ9e2sQ0h9ZTzBGZtQBTm5kmAuWOtQn
	nkxyvWpp/PTcRgIz9rfWxKLONty5ceZYQ7o2SMHb9rAX97aqUYPS4iFBT1vsZWnu0eqpDtkdQ5O
	53lMOXFQbVxNh0nzxLU5ycvoNkxH5wLTqqcHjzasn2k6vo+huoEhi7px/l4+Ex9tB
X-Gm-Gg: AYBFou2VZRj00Czpk6dvTNPQ8u/VPriNV7du4dhto0beS+kJXFLlJlR3hhHCcVRlUMd
	kte9MjDiIOtCuXs8hXpNWx6OeAw0pPmwPTdfLK7iDngI30oGsxxfk7lBSCo8R7q9GtYI44oXLPH
	QqLYeoT1HymTERAd8zP6M2e6uhy1SQ104svSo9fh+b4XrtqA8ueTnBcv9sHk8G59o0zb5hizqM6
	/yXhzAve+ppHxyVJaLDqw4I7FSy7VSe3d/fD9j1QuF5qsgUhOPVnTLGVHYzNIKeX2tkKB0mW1Rs
	lwUD3Zkt4C+BrjpjjiU9TeWWWgUCt22NyweWs+bYKlmm4b6M2jRpdsdPATWlRxqMiJ7jCMb2Fit
	G1+T5o0XJ3tc6LWXdd79WA4ZIsVTg5USmlSgW2xg=
X-Received: by 2002:a05:6102:8094:b0:7a7:19aa:8a85 with SMTP id ada2fe7eead31-7a719aa90a9mr7105778137.32.1790096895136;
        Tue, 22 Sep 2026 10:08:15 -0700 (PDT)
X-Received: by 2002:a05:6102:8094:b0:7a7:19aa:8a85 with SMTP id ada2fe7eead31-7a719aa90a9mr7105724137.32.1790096894617;
        Tue, 22 Sep 2026 10:08:14 -0700 (PDT)
Received: from [10.243.142.186] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c0f6csm5359905e9.3.2026.09.22.10.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:08:13 -0700 (PDT)
Message-ID: <3f5da6c9-7394-4452-92f8-b773cd34aecf@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] net: qrtr: Allow the host QRTR to assign a unique
 node id
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
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z294SpIpSqunJK8tFkKCjR7kD-Po0hxH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1MCBTYWx0ZWRfX4yaVtutKlPhN
 9bx7M9liN2b6IFG89HJTZ/vJe4L1aHLhD6eH29/GOWxRoq9ShXk9up85kbLrhiIAcaCiFQ8SHMo
 /4bJKfLYpYhk9CqMlMm/QnqWjODQedM=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2b600 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JX_TeLtU1EXCEf5LEwoA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: Z294SpIpSqunJK8tFkKCjR7kD-Po0hxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1MCBTYWx0ZWRfX8KwJduNvTNGt
 4rKE4dTfSqhyb+WOpm95BckJo9yDTmTMaUZv05AQ2feOHrKmbA2d5WeA5Ku01owNkYmhceWshWj
 ov0VNVPC7Erq8eMki6evyo2pkN1zsCkWS4FwTk11foQvR7DynQH/bSDWV36QxCmVnQSafPuu8e/
 y61bAyDA6scd/5vDF3m65eVq3fDzEZ97GNgLRA075aopkig7rf/udBmBx8YnzuLBNJ5Xq18iixY
 52WgJTvUE+JrGMD4ARh5gxt701T74kgtSM+/eGbV12xofbHr/zRd1qNBuddBNdmccnBFU+cRpUk
 ljTrZ3q7UCgATvUTNPMsk5Pb9xJnI103NSaERS3OCZGttV6MYqFiJxEB5tuqTbktPRXmk8RB/zy
 Gusq7p+t5T1nOT2I14bH9X4BDtH429/brBWsyXBUfWfSNYz6aKiQRc7CK+vYZoCqrBG264EwxpA
 JFfrUeqTJY79n0xptyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_100824_048504_0FD974F2 
X-CRM114-Status: GOOD (  13.68  )
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



On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> +/* Replace the node id in the control packet with 'node->nid', if both are
> + * different.
> + */
> +static void qrtr_node_rewrite_ctrl(struct qrtr_node *node, unsigned int type,
> +				   struct sk_buff *skb)
> +{
> +	struct qrtr_ctrl_pkt *pkt;
> +	__le32 *nid;
> +
> +	if (node->nid == node->ep_nid)
> +		return;
> +
> +	if (skb->len < sizeof(*pkt))
> +		return;
> +
> +	pkt = (struct qrtr_ctrl_pkt *)skb->data;
> +	if (type == QRTR_TYPE_DEL_CLIENT)
qrtr_tx_wait() will create a qrtr_tx_flow object keyed by qrtr_node->nid.
qrtr_tx_resume will attempt to retrieve it with qrtr_node->ep_nid, which
will fail. This leads to the HTD path pending packets reaching
QRTR_TX_FLOW_HIGH and block indefinitely. QRTR_TYPE_RESUME_TX should
be handled here.> +		nid = &pkt->client.node;
> +	else
> +		nid = &pkt->server.node;
> +
> +	/* Rewrite only the endpoint's node id, not those of bridged nodes */
> +	if (le32_to_cpu(*nid) == node->ep_nid)
> +		*nid = cpu_to_le32(node->nid);
> +}
> +
Thanks,
Youssef

