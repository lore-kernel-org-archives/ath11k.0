Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E26C531D0
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 00:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5oCbHR7p8nDpjIFLZ0XnVLrRBfnjEM114XfiUZr23U=; b=iVa7N2yy1+4ZFZNzTNtJDY4Qec
	HyfBdnW1R+JtZd8b11+1L74N3OTbXmSwYalrLhje7/8VL5IdSnM96rXR6OkuZp6CumURUJaXEYaaJ
	7vpGz3A9znzkxJEOPwHjYBX2NzbfovDhmr66gTfscUSuprhqp38KD7HSuKmnsQsupswYczjxGKZB6
	Oo0YnD8/0lCgUCFs2K5tUidLuu1qV0HWQszVIz/eqsVng9Bpr6xjgn+Xn66BwGq5cE25Yi5cb2Lo3
	Pndhh3zHhxQY9mXE2zIfXZn5gvL++SD1cL20F462/vgIAtsdXHb35vG3bcRQp2ip7MW7OxLVZqpwA
	OirWBDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn40l-0000000FJ2c-3i3b;
	Fri, 24 Jul 2026 00:43:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn40j-0000000FJ2F-3ai9
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 00:43:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeLK6955613
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 00:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5oCbHR7p8nDpjIFLZ0XnVLrRBfnjEM114XfiUZr23U=; b=JVTzPTJWQuT0ld1r
	JglsgnuI1zYASfksAh2/lGhng7t44TJkNPdZI95+I27jD6FJcgVyV9CcS+bD9YQz
	0wRiXFjN+QdpEvJOdMjdOnpq3h1cFsB5KC2UmdVFVDemx9x4fUhNSYHYBeV2YeFO
	1qtNCcTXrzbBlZlxTcL119OstHtqr7x3s78zRB+m4C+4JUUnXXo3VYmcfkcsgMiQ
	LjiMeqwJ12sskRriGGy7QIKAUd/y9d1uUM5BNxBlBABmyE5Xzk5SQh7TqrnEB7Wk
	pWtm+88rTO+zpNpxpcLrNBiGv1Uv3F5wOEIuzp3pTS1gX37mph+Qgg6zQoii1+fz
	Cicfig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnuawt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 00:43:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso1652617a12.0
        for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 17:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784853812; x=1785458612; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5oCbHR7p8nDpjIFLZ0XnVLrRBfnjEM114XfiUZr23U=;
        b=jP9xqcuVvkCiwaa6opmy4Dk1OfMHdE4Ix6eWagfg8QOXHetNflGZIRHxR4VMk5F29c
         iwKg5jN24VdK74a0WmgqfZwFKkEMf2dpujOq+QES9FT+P1A3X2sAAa5cGgrhSB8ZwNx4
         wyGP8WmKg8xjJBw6JrDN43hUZmDPnCHmHSyvaUgOhX1udTMgO5zZHi+ON+8xN4F0mwar
         2S1w0L4j4LKJcGMYy8Y99PkkdObE/SHzOUKb4/NLvGwIJpBu9tcUkBNVEYGcPv9YxfYF
         0jscPrNk0sL6RNNWHJEcul6B/G28uWUfeiI3NAr6mnPhoO/ohbYM2MYlJvozuwM7qiGa
         1ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784853812; x=1785458612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5oCbHR7p8nDpjIFLZ0XnVLrRBfnjEM114XfiUZr23U=;
        b=nc3/x2haWSoe47mYpkW0mRocJftapnEfvXMT8Pfpez/Xqr3nE5viuUn37yPywLkPSu
         ZvN+YniMiMsbAx/TjVyb5RMj6LGeOdpVSNb228hQ7KftGggPTTVhi32gZThkM82cVeNu
         fkwe/B6BuURVFw1voPwMn+jZMNU7F5vT6LPYYE9oVf6s3MUpm9+RA1E2mPo2avwGeO4K
         98Qcd8dMNY7OGo+JB4fXv1QXCC5K806aEFxn4DHzyT+NfAejsJqHF2VOHXn9QNxQrlWV
         0xgtlViHDcNVMkynBp1ZrcpwGGH2d5cDTM/CK6fyCLDtZCCd3vT7vMLvOARmD2LNVmi2
         2lww==
X-Forwarded-Encrypted: i=1; AHgh+Rpjr1tGXfY4zJ/C+ZbIxPbt5fvWmc7fHYEYSskR00afvFGMhpY766XJld4/ls01tYUe9SPj1KE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQo/X13kmOrN6x2p+ab5Tch5KDlNvYpMmcj63CqER2q7MyRw8Y
	KEv3OCtvhVVHseciiEQcfoj+LKaLYjhUXai5iEEdVCxAahCSKbI9OSLrDGkcsppA/T5TEdL9pAQ
	FllolbMtCrr1q98lXF0HZgzjHS1qFjM36QT8P0+R1mxuf/q7jNaBOYugabUqzdZMZ
X-Gm-Gg: AR+sD139KwDBpRDR6TBBrwDk8e40syCEjr7Dp441rr3PXyBGcZdJzY6E814YHfkhMws
	QCIsprNcIWj8mUN73J1qw8fRZR32UWXpUMbnFlapkXWlM4zku2Wvt2aDnZMTFuuWt5bjAPvzaEb
	Xbwm9OB57hn0w5sYmGi4BKht4x7QYHyCL73QBLGeIKZQZFqEQvvq/wZzgA/kzrybz/LlWkvpV+V
	K0Eq7A0Vq4ewIyFkKtg7vGbxlbs1FlJB/YOhqMrGbnpdQ97tMCdyNVMHqekmiLINc2lb2VgRKcM
	+Amy1jecg71UGCE3nvlWl1RIMm8KF0V5dxtSY/WFcDbgW5UZCxXnNNsmWlRoWeOmdyZ2epC1Y/q
	t3V/vW8fsDdErmJCMENJoUD1Jx8+vIJghobr+3v7QTKus0H1hng/vWk1HtQ==
X-Received: by 2002:a05:6a21:a8d:b0:3bf:ba89:5236 with SMTP id adf61e73a8af0-3c44b065742mr5930601637.33.1784853812340;
        Thu, 23 Jul 2026 17:43:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8d:b0:3bf:ba89:5236 with SMTP id adf61e73a8af0-3c44b065742mr5930583637.33.1784853811959;
        Thu, 23 Jul 2026 17:43:31 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e0818e4sm23730568eec.22.2026.07.23.17.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 17:43:31 -0700 (PDT)
Message-ID: <3998e460-bc57-4376-a5a3-0dfc6852d625@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 17:43:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: fix txpower in ap mode for 6 Ghz
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sebastian Gottschall <s.gottschall@dd-wrt.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260514202750.3040404-1-s.gottschall@dd-wrt.com>
 <2c56c58d-4e04-427b-9309-8895ccddc03a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <2c56c58d-4e04-427b-9309-8895ccddc03a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7wWNfkTsfE0O825Sy9-l04kariYzexoa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwMyBTYWx0ZWRfX39e9e8gWNSdw
 B3M35N4+9WDnkBhS0ZiFpn8OA2yljph+bc3ZrfnlIBawh045hD/4ac73i7qHFcKcuVeFAsYqRVS
 LsXQ+oKC+kL3/xF9KcQXFjoN/Eu6j6L0xqzvpiRYBo0f3VvZubpOSFsUf2yMnMPvMPUl9Uq8h06
 X9+qDoYHuCRitGpH81YW8x+TtyWmyJaprmGatYbJKNvKYVIUrH9zjJ+wneRrKXsotfBjfx/4rtn
 5GX64gczmWfTyv63MYEbSdcttzqGtymxXv1ojVP3OhdJwlBSiGpqHYWtWo+RarFbKhaihybqpCA
 1vXaSMawb4AUANYKUbh/uDB6PG8Ix1n7JssHuPANsDZag8IiP/HR9SPlzeBmF+8TQ2e1dVi9Oik
 crsIUjFgl1SPjESMSjpNxBh685oKs6nGOF03HI3jUQfIV9kyz4qqJ8c/4vdDS6KOXiqrBVqCUK0
 0LNs0/DvCR5dRpKyeeg==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a62b534 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=epNStaLaolvpL0WOnR0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwMyBTYWx0ZWRfXxtaQKGr2k/Hf
 Sm5BhALToM7SetTBZEsVfD5lKcAnlakDubZ5yxFS+h9v0OR6Xuie9dLjxKApXblEZ3Ji3U1r5XE
 fXH0fFFEZVUSnKas7SKlrrt4Fw3bbU0=
X-Proofpoint-GUID: 7wWNfkTsfE0O825Sy9-l04kariYzexoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_174333_909962_174AD251 
X-CRM114-Status: GOOD (  11.03  )
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

On 7/19/2026 11:31 PM, Baochen Qiang wrote:
> On 5/15/2026 4:27 AM, Sebastian Gottschall wrote:
>> fixes: 74ef2d05ede63fd6416aa635aa8972dff901325f
>> (wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz)
> 
> checkpatch errors on this. Three problems: (1) it must be Fixes: (capital F), not fixes:;
> (2) the SHA should be truncated to 12 chars with the title in parentheses on the same
> line, not split across two lines with the full 40-char SHA; (3) the tag belongs in the
> trailer block just above Signed-off-by, not buried in the body separated by a blank line.
> Correct form:
> 
> Fixes: 74ef2d05ede6 ("wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when
> EXT_TPC_REG_SUPPORT for 6 GHz")

I bet Baochen's e-mail client split this when it shouldn't have.

Should be:
Fixes: 74ef2d05ede6 ("wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz")

(The "Toggle Line Wrap" plugin for Thunderbird is invaluable)

/jeff

