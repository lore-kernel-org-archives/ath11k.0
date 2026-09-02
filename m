Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3BEC61DFD
	for <ath11k@archiver.kernel.org>; Wed,  2 Sep 2026 05:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RX1tqIKGVP0bUorI/5rlQmkq+iT8Q7dOX+hFIanw6B4=; b=rMZmwbNT3UghA8T7P6IvDikahP
	bJG8Ev2D45O8hca4WZ8r9XRcMYOFdtNDsiSRa2RI+BPA7b03RoDVEKpByoNx4hfYqy2wJf6MLoXBQ
	xYX1wDkiizmgxe6491Ew/r6/uaAWCiLYg2q5IvZ0Ac1sBiMd5pzlv/DKWylflTZnLKhryG90Uiuw1
	qMIU5eINbBUzXemvSc2lRJS/XgvuRzmLDUhNwLrlx6tdGwf1q35F9neB1nOlyVYhAlOFXM82os7x9
	azDUWv8JayECyk7ZqQ6xMl9avM/Ri9/6uB0/fYuvG7YL1i0MC2//+Ffg6hTVj4GBr6muNUjGsRsFA
	uNaOKuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1dQZ-0000000DncP-2X1o;
	Wed, 02 Sep 2026 05:22:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1dQX-0000000Dnc4-0lhJ
	for ath11k@lists.infradead.org;
	Wed, 02 Sep 2026 05:22:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68258YPG4097928
	for <ath11k@lists.infradead.org>; Wed, 2 Sep 2026 05:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RX1tqIKGVP0bUorI/5rlQmkq+iT8Q7dOX+hFIanw6B4=; b=m7PaReY9pZUxLkDN
	dqh44VsclV1XXF4zYuQ1SDCcxyEF1yYKhrLWFgdXUCgKFj9NP+ITQvGs+aQNz0zz
	Yc26OZM1m8LIQPY2lKNMoPrLGCWaEdM/nR5WuxXAJymwnXaZQGE/5tOq6Z2w/BUm
	k2Sg/UK1POZD4ZOhzUNqjlJsNRFKYP/ZK0naZhLk8K8a19rRz3SD4rJlJ4fVFQxm
	oVrJVAFxEDpHQle1gjlCDH5kVr0O415/CNuBvgmrEmIiQjtjK5lglTDXLeTmLM58
	yTBjBuOtQS4+EKooZK6BtG5FRRj1qBbRDlidekgf8NcAohzmg66sgexDJKAmfF2k
	l6vZwg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt3k7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 02 Sep 2026 05:22:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1270866a91.0
        for <ath11k@lists.infradead.org>; Tue, 01 Sep 2026 22:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788326543; x=1788931343; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RX1tqIKGVP0bUorI/5rlQmkq+iT8Q7dOX+hFIanw6B4=;
        b=kPxOXxaUWxZ7zA7RgAk0ivvPZnOcnTDp1lK1Agklg5kLTdRvoHTZgbd8wTb4fRXHor
         cty/AnsYc6Kby+dEd0z/K45G+RCIyung9f+WtccWzrvlNrYwdrnEeGtc50W8iKknoKjN
         Uhx7uwoWaozwjJDmEtEf3awnpDfgw2pMWC84VniZt9jeakAGfTGVTI9rJYrIzSchTdPY
         2wi1R1O8NKhro2TVizZdShq+TIet5jf50lw3glACqaYYQ3jQl9qbgRgYTMsq7Hyb2Twf
         tmxOxV7cI9PqUsBxX9VemTjrvRNeElieakGECft+S9QahynQ5PP5G8GNa9LJJe54vvBD
         V3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326543; x=1788931343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX1tqIKGVP0bUorI/5rlQmkq+iT8Q7dOX+hFIanw6B4=;
        b=e0HuwTKQl+rK2XFFizqNNhoKguOWv6yk5CyEG6IAtvnRgltGgDizjSr5fI689id2Oz
         JkpoiP+nCJRjNCGzrr1tJ4V00fSipz0Sm22JdE6Q1BYruiO9jKvw59JUoMrEbx9H6s9H
         mRs6PGHS/OUNrjyh6nQp1t/jAshP0BvvtdlVa/FQ91B1sgTq3WgYenDxAceeIK5kYJ8f
         YdGlqF0tJ0b3jSUi1UJX7WrUJSNfyB0dZ8I4wPO2J4C8eJDtav/8sjooVJCo4zbOnAZ8
         sPrgbWAjWcNEMEVyQajZWMR5ekMBjUk6kGWW5uPz4BecKMUcCTbTcZnjJ4c/Kw8FzTnX
         suqA==
X-Forwarded-Encrypted: i=1; AKwUvByMtKq+UlDFMosLZDRbFK4f5Or39puR20abNNtP2MIb3TTzKUr60lwL8jUp9Mfv/rmbZIQFHq8=@lists.infradead.org
X-Gm-Message-State: AFuF++l916gm0pa9ui/XM9YeU/kWxxKf44B/KGQdAl58MLbNfhZt0Q5g
	ntEuSw/DotC5EvF1tXNPYUANAJ9pNPfs6h7FezadLLn0o/p4ZohPJ2yOJ8uJzNs7wb6UmuC0SL+
	vNb+CY6o/Xynx3PpCvtGja3nEADHQK97CYiHYMd1bLQZw0Cdwaf2HtPoyCTJwYdup
X-Gm-Gg: AYBFou04W38oUPcTFjwb5W9gIowofMxy/qtvLtsfGTw4DcjBfFfVKjPXPAHQHvj7aGZ
	QmGYIgNHO8cVr8jfQ9Rw0Mh4P2axvkOQGtSd/gk4VmbxuFOVS0pRMxd6wvr1RuJokH6/C9lRszd
	7tfJ53YyAL7zWnZDOgS9aTTXTLNvid85W3f4PQ/ZPStuKnXKcKtF6dmAa5fD/TaOYCOqs2nJoSW
	5UcxZ7b1B0myopcvsmNO3I/1UWxITy7g19hA5XKODdPDsnV2Jk4OENecU+B9j1TOehV+h5PmUgd
	SSNe/k33XunrJwlpvWZP8+zn4+YEopTBgb+QEnv2Q78UbpdOdDsAIpByxSsSuIOoXPesLj4ufJ2
	S7QFvZoyspSUUd5zLwJ1WjMCxTk36NtuD
X-Received: by 2002:a17:90b:2f0b:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39aee1f5fc2mr3694899a91.21.1788326542654;
        Tue, 01 Sep 2026 22:22:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0b:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39aee1f5fc2mr3694846a91.21.1788326542204;
        Tue, 01 Sep 2026 22:22:22 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430eafc907sm3003702c88.9.2026.09.01.22.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:22:21 -0700 (PDT)
Message-ID: <cf33b23b-9068-42e5-ab90-ad7f42d72b74@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:52:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] PCI: qcom: Enable ASPM disabling during link
 retraining
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishnac@codeaurora.org>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-6-6dea79786b37@oss.qualcomm.com>
 <jdch2j3vcjsr2f4u7jhiazuotwqu6pon4xlvhzuhrzpzjhmkkb@7zzy2autzbmo>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <jdch2j3vcjsr2f4u7jhiazuotwqu6pon4xlvhzuhrzpzjhmkkb@7zzy2autzbmo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0NiBTYWx0ZWRfX/zebj4YnIuFo
 fE9NIafkSnDBk5rt5rQgMJWMsqLUSpvhFsERWXhTMGe0fbxRT3cDdRxZ+eEvEb+Cx1YattGNqf/
 aMO4o3/7H1CUS7B5GhA9mH0t+TV0U4smvmv45IuVKMMzSvsxe0hQ4ec1su14vH06pDEDj1CMrY8
 jSVztUfVg4w+BFVEBeDyr7/SeHJGRfMkU+se4CF8vDirUXB6P2s4wOin/BiDYfMYhq5cMnl6sVz
 efJmwXYUhL9TwIODZ9cnUkm1lGpZw55R0OfLghR7yuWC7M5ZM7JqvMADgYpzrNSZNNPQLQCUKbu
 +b62P7sVpcq7F5oE7486L3nZESUu9V+GgcgkGguU1vcGKDWT2ebqamLrE2r+ICDn/ypXOaHMKTC
 ZfScND+qgU7uhQABPodyebdichFPNDZasR1zQ7DvbBukoNBSqARMkWCu/1r9tLyg3fYrtNMLied
 DbaoQSZgnhEaZKQh0SA==
X-Proofpoint-ORIG-GUID: 9HVcD_X1qSGapC7JFmm4KtMUoEEsFBs4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0NiBTYWx0ZWRfX6kZuDTTeIFNv
 L+iyUsy8fh8o1BaGjirQtlcOpDpxo6munERrMEHl1Srw7cuEC+jOSGqvNlH/iHZ4nHrIwiC6AI0
 dq7a9cTLf+ZFv7yaQctZtEPJSnt37Ac=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97b28f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=LpQP-O61AAAA:8 a=B3be4mm0s3FIsxF7KqEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: 9HVcD_X1qSGapC7JFmm4KtMUoEEsFBs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_222225_380969_4E22602F 
X-CRM114-Status: GOOD (  13.46  )
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



On 9/1/2026 1:38 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 19, 2026 at 06:55:57PM +0530, Krishna Chaitanya Chundru wrote:
>> Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() to ensure
>> ASPM is disabled during link retraining operations. This prevents potential
>> issues with link state transitions during bandwidth scaling on Qualcomm
>> PCIe controllers.
>>
> Is it really a controller requirement or a device quirk?
yes, it is controller requirement, for the future targets there is a fix, we
will not set this for those targets.

- Krishna Chaitanya.
>
>> Signed-off-by: Krishna Chaitanya Chundru <krishnac@codeaurora.org>
> You need to use OSS email.
>
> - Mani
>


