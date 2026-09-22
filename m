Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD32C98302
	for <ath11k@archiver.kernel.org>; Tue, 22 Sep 2026 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=; b=iHYuICE2SHj4aMNMVAD4YZBGVj
	4Ekd+F8nJ2+uWfRTj6HUEUaCKsyCZ48py5rrzfEMvrMWwB8MPfH0JnfyiKrunUVa+s1emrUEvQMNq
	Z1q/2lW9NVshkJ23Bzx9DRj8QRayMirrJeeXwHfX9y6pkyyNequjXpOZq9ciwZ1lxavZhk9sxqS5I
	XT/AozLrS2kzvvlp7TAdBiL4Poq4HMNb7KO2S/ukI5Dx9am4cDOFEcWZz4m+1UC+ufNbZfW3dNt9A
	TbfoRJH2eTEh5GC6pGMqh2XUJvvS927ezyox4W2A12R/Kcq8edt1hLvIL08ZyQOEQKAG2AJuaVEah
	RE5fcAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92nz-00000005x2W-0N8P;
	Tue, 22 Sep 2026 15:53:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92nx-00000005x1q-1Eh1
	for ath11k@bombadil.infradead.org;
	Tue, 22 Sep 2026 15:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=; b=I8Hz1NGvsT7Iu0bHVdXGDUbGOD
	54yWAridfxEKhYA8KEgQW06BTgxowV3Z/aOv+Wz9UdKDnQM+iw36NXgTkijxWDnSDVmtgCh6SMU0V
	G3FccTZBsnTO0HF8kuUfNCM337v3VS9cAnBUgwd0sRcDpDiN//8wuIG8bdNXb0LZt3QlURrYNu4y8
	fc/2SU7q3c6aUzuWn2lfDrhsFPaCD95PbIddu6xyjy3LDpL9TO5MOgpLmbn5TFJme/Zm629KpHwxI
	NAiN1EBEmoeLCDC8nQhYcQ85nYkUR0uUau98uxLPgViT5eH+5CkH+gvV/BdDI8zpso6DdqqAf4ycO
	VK0iqpKQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x92nt-0000000DmQx-35JF
	for ath11k@lists.infradead.org;
	Tue, 22 Sep 2026 15:53:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjQIW705843
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 15:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=; b=eghf+xvy//ZOFslf
	UpveaGSVcYErvpNTp5T2vvsCG2NizpveWEYt4+MVh1sZFUIW2iXMDf2koLfzGvxw
	Fpm69AfvdrlllS+wklhM0clBw+kQXpvQfbFtAvmsRVD1aNFxJWJ9qVWsxQyRtgSF
	BXGKQlyBgfpBKL+27SAXmqIVl8sfhVa61k0bcIwLQUIdY1BfPxh68UiWB3ECDcvo
	F0ilmftXrHMrJtzTwfS8kH2Gl7yavjz7AEzq2JZ7+zalAxWcEIekePOf6j9vx4Wq
	ikbaCulpsDs8oJ4QUgeWcwrNt7hFwyzK9Q8/Byr8KrL1EiYErSIv2+l2I0RY9ySQ
	WWcGMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbaumej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 15:53:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so78733345ad.2
        for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092385; x=1790697185; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=;
        b=UGLgcr6676ZLxr8xEIZdHPTBOD5x6VbECYtMXUBm4V5LFo7bDrkUYnMNOT5KOgEiNf
         TG/Ff0sznvlyMcvDMIwnahBejABr+ecmVNQXAns7D/+zEcYR1n4pIGdpRW/8m06pFpQe
         X95U1lmAAL/8umoE8Z/jJ3+fRyUojQ5gG/LgE3YISh9TwO/UnmZZyTlyi9X8CcQ6+tNJ
         eJ1Lh2PBNKnyDn0TAVK/q9vN4Urer7EnbBfhbM0aDvH3Siy5VFQWrI6FQdU7v8LA9bae
         ZnYM8nyMv+oAEBUSPKQ7MPKEJrNeYFrytMbVr/EAn/6mTayHbu88WeMGY3Txg84j0zrz
         7dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092385; x=1790697185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=;
        b=UKj8cl+MixJV0JG1AYM/liMGqUED4GtCSgldCRJRDfJ9XAX9YGmAA8NylCCiqqjQ2y
         qZWIdXLZMtD86pPKGZcRqPLByHW7if9dq7CWPZq8SaEWdD83uqPMIbFu67xxv9VmN/aC
         fCUlVvCsECNm4RsFbNYH+W0Si9+IRaYi2VQUE8dga94QUK/FNYzUznZ3+8HAdQkWKimO
         J9FAXMfrW6I+dvDKgMN7tZlWkPuGDwW7FGDCojJcAxhDh4rsvRL+jL6y3FMQbtxsXdic
         OtqiS5c/GDHLWXI84vH6EKDLB561C5UTDTOxUQl91L6FOpCBdJK8H4uH58npXl3XRCNK
         Hp1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+Js32lJQ1HiTVWYUid+giDdO+I9mv/jE4Ku8goTOTem5eEstvCWWxFQpIN8ljemJBUCKiWNk=@lists.infradead.org
X-Gm-Message-State: AFuF++k1sRsFzC/nbweQaeRGptFrNCN5EplDpk6IVp098bqzxus8tkpB
	Q2hrSDq6wSSYCsIx69VSYX7Le0iHgIcSMedCA96NPv/3qRHSnXDsH8+9fUlZ8Ntw9y2F0SoqdBU
	ReL1lHDUJg7jCcEbmOLmQyv5BeadFhmtxuWnLzaO88d93ChiaD1ljfe5uI/GjTkoY
X-Gm-Gg: AYBFou3greXl38SXLOuNXtKRy6MpM2esGEB0Q2XhTT7RMihYsLYcunRQ8HL25yafFlg
	LgtJ41Bc782X28rn6kSG7ZqaHlwGWeGUSnCUDuuk52GS/RloqkeziSiVDkHgDXFgtIYktC7cN7B
	50we5HYOXPm1vTRAv7UC8WqJjDw97e2rtO3Ys3Ilm+mBCrTuajtKm4TDrEzpnuRW7gco/e2B4oc
	oYA3/ccikO+iMMVoBUnzHATr9nLQ29LNpMSWBhodg5nDMjb6nBGPhD3c08KK9XDVQdBF8xJmZv+
	EnK8xVXihLjvXXRy9kPowsNlta7zh8hz56Y1+wwNM5Asou7c8uxKF9qChkpUopxsheYoQEIHc80
	gxlIfxBGoha3zyRxmkDf5bCNmGk1H
X-Received: by 2002:a17:902:ce8a:b0:2df:3b08:a30d with SMTP id d9443c01a7336-2df60b60b5bmr20251485ad.43.1790092384958;
        Tue, 22 Sep 2026 08:53:04 -0700 (PDT)
X-Received: by 2002:a17:902:ce8a:b0:2df:3b08:a30d with SMTP id d9443c01a7336-2df60b60b5bmr20250935ad.43.1790092384329;
        Tue, 22 Sep 2026 08:53:04 -0700 (PDT)
Received: from [192.168.29.33] ([49.37.212.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d02f7e1sm13009205ad.39.2026.09.22.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:03 -0700 (PDT)
Message-ID: <f8f231b6-a4fb-4f19-9ec2-949668bfd5b7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:22:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
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
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX9lACKf+7NWok
 6FMg5wc65o7Z4x/x2OVsvFyKC0/LI+dMDBHBZ2JCVnFUmqEhT6LhWhVXmwcR0CrTqddUlmTtTCN
 juEJ5gBDInnnk2Hwra1nnp8nGu5VLtz4daakZATmOn5c91fFOJ20IPXwiLM3To6BMI4dyfsWKtX
 fxNJ9GBg1ap94vtVzIkoNVLrsEfy+6llJudzhstSUU8iWX9niHkZ1JNt2HYJI4A7Z/sp4VWVMiu
 9qXxQ0onqeu9GHhJa9lZCrkCbHQWZ462Es6lRVSvnXtPzTXZpHtsjLSMcIBBZ/enL0Ia3A9Mctu
 1b68Fh6SANwgMYA+ThAOCdH3UZknf3wnjNPWh2JQX9cmFt/XzZ1RlBlXX1JoOP/4AXmEWrPFyey
 xRe/ne2A+S0Pl57E9y86OaCsSYqL8cel3pBH6HJ1KkQyeSXHMTJivitSDxS3m8QQFdPKDrAT52s
 8jBZlvsL9Tpf9zTaSCg==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab2a462 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fVbWt6ZMyMsyUNhTwytWAg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=R4z_reooDQMcG2LTbH8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX55ekj63I/tcx
 H3pUFuzj4XidRuAu+8AKKsZ03ctbZmk6iVzeZjqo2czD2/Od5b/aLGovdBGqofRpm6YJj3jNLp9
 q/MK3QJqP2oHem2mLW7fUMbS1391ZvQ=
X-Proofpoint-ORIG-GUID: jqXsWZ-eaPuD3_-Loz-dTMOlnKDRh-ue
X-Proofpoint-GUID: jqXsWZ-eaPuD3_-Loz-dTMOlnKDRh-ue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_165310_638319_193F0913 
X-CRM114-Status: GOOD (  15.69  )
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

On 22-09-2026 19:11, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Tested-on: 2x WCN7850 hw2.0 WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> Tested-on: 1x WCN6855 ath11k + 1x WCN7850 ath12k
> 
> Tested-by: Juha-Matti Tilli<juha-matti.tilli@iki.fi>
> Reviewed-by: Vasanthakumar Thiagarajan<vasanthakumar.thiagarajan@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

Validated in ipq9574-rdp433 with three QCN9274 PCIe devices.

