Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2600AC43458
	for <ath11k@archiver.kernel.org>; Tue, 30 Jun 2026 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xD00hz2MK+0hIsyBDC5jnHf9Euvjf05JjPQj1W36hvI=; b=ZbuY8wUQqXU/CG5ZkovRDRkuh4
	7YWIcEhh2c1fbO+duSN4F8swoisSPY3kaGINM64TmZRFyJlLbO1NqP1fWWf7pe7Cq1NZxAOFSnqbH
	d4g43POAhdptb5j8q/ZkHa2tfDkKZDU9FekWrcTJkWuP8lQuI9+MaWyL310jhzWpJYut6wK8f5vms
	bqP6FDuF7XO0rmMl2Jqfa/uUj/ZyNGCBRcvBKqh/Mg6YbID94YYJAs0q6N52ZNKefpDKZbwNRGQb8
	SS4NevNqpAjhYR48zZshg9C59Vx6NaT9xntmxY2zO3Yu0XJjdyAP3QxXftJ0C5XKGhiRbarP07nLx
	Dzp67g0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV2Z-0000000GUvX-2NU4;
	Tue, 30 Jun 2026 09:46:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV2U-0000000GUuD-1iin
	for ath11k@lists.infradead.org;
	Tue, 30 Jun 2026 09:45:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6Cd5O1074123
	for <ath11k@lists.infradead.org>; Tue, 30 Jun 2026 09:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xD00hz2MK+0hIsyBDC5jnHf9Euvjf05JjPQj1W36hvI=; b=dsBiNXF/RxldppsU
	2WhMEc7IsBVQsjGrGjivxsG9bmDTSIasTuPBOGdxAPbViTIoA8Cqu/VbTJ7bRs4K
	KQbyCOtvQh5j+Gdq3NC3q0OF9X2GsqZGE4qMDF3ACBIk2bnCjDJaOXIIwU57Sqo3
	bXdc4BYbYy7b7rZnz0dUf2oT0vjb0ldeTLRDSsavyVbIPUnBOYdtCFHXZoeZpmop
	3VPiTarGeFUeV5KmFIlvsu1MCubuqull251J3wF5u4emMtsZO+9AxWeLzDbbqmDV
	2hzKZjiG+GP1TDYFCRN/DI2TtqafxhTEjNmIz60WoUk1eyUhR8rco+js9bIwjFL0
	qNEZlQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k2t1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 30 Jun 2026 09:45:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c62861b3bso13526421eec.0
        for <ath11k@lists.infradead.org>; Tue, 30 Jun 2026 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782812756; x=1783417556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xD00hz2MK+0hIsyBDC5jnHf9Euvjf05JjPQj1W36hvI=;
        b=GjSZ2AXo03pt2inHDEDdWj3BlIRTAEcNjNqA4cOf6ge7p9fe9t3lOfx4MPkFy0G/XF
         lbZ/pwZrTgx4a8kwm6M3bM/nY778rQkNY9zXZBJ/v/QqeQo9uFl/SvdYp+gpPFtmHFn/
         JTdJAjhUZWnTfY+GXanPF84jlPjF8fhLRgKBInJCmgKGo7MzRHx4cgJg1Z8XzgpnUoZA
         wEWWMgoOAsXHZUlLm8OnzVnZpJv5uSkealf70NbF1ZrF6ex/rXkpj+LQCZzOFuAqN/ut
         k7QTeQ3RXgB7yc8CKgoQx9Nsoy4F17zifhOpHxmlN8g1lnpwCDnVe/amIrwhct0kyt7c
         VtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812756; x=1783417556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xD00hz2MK+0hIsyBDC5jnHf9Euvjf05JjPQj1W36hvI=;
        b=sYi1O1OU1d1j6w7nTXRdFtU5FQdfad6ky6LBbIFHF9nKBXwn9LlyveOq/d2tKN1Qg4
         l7HYM94kdqu7mjObqft+4V6uXajeCw9MUmZhHAvIWT7Si8xWbJyEMSW6Mi6498HptULh
         2nl7nXQdu4iBUx9Gwks3TnDtthjVi8xv0nn+emK5o3soK86QZ34V3tfusJxp6ncNQjBE
         IOk9+20n80oVGvJV91wh/mt/ruR4gvyuvqAwSdfuo9MFYgfA8OWk3ae9rhXvDJNwT902
         ZuV9rQl9gvblD4gRUCVZN0AngzvzyKBMtW0FrZzw6sxnJB39l/ufqN3c4Zrml8DuJZE6
         twUw==
X-Forwarded-Encrypted: i=1; AHgh+RqfLUOg4n9pgro8aWwJd7dpgJEU3At/QbZ70TtWiyDFgmMVaRekT6JZ5MwWaSZvWCHeypR/BsY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlDJFuK1shS9weKnzYvtqHbEfTHs43ZHcZujfE3tuujnOPYJy9
	6pbTwdxbWgRkvmEE4ZkcfDPcUDwB1SyCu04sybHEjsgX9H58U2TU3HmlNxWwKQpgrMYGlWlhpbo
	IXKgXYvA084Ou8rpecvVz8b1W7IaMS9JgLtV65GFOqjT/2HbZd0kHuMpY3df4cKHy
X-Gm-Gg: AfdE7cmb92gkPqPH+o04MB3AAuLSqw5aId2m0YcPbxRLq2GTeTIHjUltVBubKYcWKpy
	gyvjKoYlyuanhpNtqvkBf3R13Oggnh2Rr06Olx4LFKhYI9AuXKOgXfA68Q/Saozfyw/OLOaQSYp
	TuqNrDRrofhSyjdfAWHj3fssJVcV/VVAb5WZyO++iWpEPhnoKWzvg56K8aDcu6eMWv5FWGODGmD
	/XLkWN+PdRf74x0ZPsogE3wU+pIDsJyUJ8uF6b4LLJRe8TLQMkwnSFnH+ECpJev/dKMXp/X4dzf
	/6mb/q+HOr1sUYBEC8s1mhrcWe9EWeny1OuFuyz+D/Ae8/zeK1dJvZuGm/7VAXWQWzJB8kLPAzl
	bF9wn/pTs6YhcTiEC4TUnoxGtV5rP3qbIspexTnM=
X-Received: by 2002:a05:7300:3c2b:b0:30c:56a0:ce3f with SMTP id 5a478bee46e88-30ee11ab8a2mr2614919eec.2.1782812755973;
        Tue, 30 Jun 2026 02:45:55 -0700 (PDT)
X-Received: by 2002:a05:7300:3c2b:b0:30c:56a0:ce3f with SMTP id 5a478bee46e88-30ee11ab8a2mr2614893eec.2.1782812755481;
        Tue, 30 Jun 2026 02:45:55 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5e4d1sm6137828eec.6.2026.06.30.02.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:45:55 -0700 (PDT)
Message-ID: <eee587a3-2264-4e85-9014-c230988de6db@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:15:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX4pnBGv6HmORJ
 PYjwoT6PLCq+id1MjkGQLAw+IvPksCrfIAQ94XWi+An+sd86FkT4ZKMtzWK+MTQuUT0RX9x4K4x
 5JZN/bZEYIzLDLoHbbcdUWe5kIPHeds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfXxL655TayBRNN
 OwOVzb0l2t8hpZPtmuXmFpNa1hXrD6efBfbF+MOHtBLkd383C+Q0PLjdh2C3/NDNZvvsSZ0hY5R
 KfYhCYKPURmrpk5fAv2I7xQCCpDIPggZWd9vJMDjH2GHkvWsLwR9xVBZuY9bO6H4xe8FLPBk7mv
 NjpCsAfaRLsMe4GMOzCCDQZxDvHYiWiSm/PBcK2FEnlCUee9HHTtDAnJLcVPwQ6EaZ8j6WC8MPO
 sKJTvFl1AId78jrhgA1W7PPHTbtp0u3m+eiKNHLusf3BCHaR5IzDJZBmKPMDGWSUGNRSqGavXD8
 2ydyDsxED7g2At620jfb+RSvZpP4w7gSck3GZvq99j6Y2bj+uactQ3KP+zKFFIcBufEXhyeutf+
 T04NJCmI5gRK7tkaaQg4VLP9AOSoK8J+dj/o2Zh0vG3V4/xolL34kdTNAxJob7nkAbio45NB67D
 hs0WZKs/4sW+kgU+fOg==
X-Proofpoint-ORIG-GUID: H4oIWDJZAAYBhsKxON6jlmPjDcq1st1X
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a439055 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-GUID: H4oIWDJZAAYBhsKxON6jlmPjDcq1st1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024558_580877_4098641A 
X-CRM114-Status: GOOD (  13.58  )
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

On 23-06-2026 19:46, Manivannan Sadhasivam wrote:
> ath11k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
> before the delay.
> 
> Compile tested only.
> 
> Fixes: f3c603d412b3 ("ath11k: reset MHI during power down and power up")
> Reported-by: Alex Williamson<alex@shazbot.org>
> Closes:https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/pci.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

