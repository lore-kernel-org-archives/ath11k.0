Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1873CC5B572
	for <ath11k@archiver.kernel.org>; Wed, 12 Aug 2026 18:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=; b=aI5MZm6DDeiXfCt1xUpBKen4Tf
	cAMC+KGB4yTl3mZQjoAu1Ov6nI/L1XQO9lQil2ffnEIVyY9atQcD5t2gqK+JIYDIzj4d6SDtranuE
	9MPOtlzufCIbr1+sgsYO9rvGCOMxhbqt5p4GHjHRWDZMj12u9whHhg+nNwzETrXA4h+NjRgDPOH6L
	bRjwnA7w1StOTrvPLnzKbD3/DGIRSJPpilHZBNUx0aFLDyWg6U08Cn9uxvSUVk5ZWXryoyQpKmste
	qm/8CAGzr4Z3C98QTaEG6mJQp6iwjNCjVd0b0hBpoRFErUfnOowr0Aw+emuSC05LMJ3XRyW+59kVz
	p4JCSiaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDai-0000000Gmne-2PKQ;
	Wed, 12 Aug 2026 18:22:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDaf-0000000Gmm6-3n1H
	for ath11k@lists.infradead.org;
	Wed, 12 Aug 2026 18:22:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8gDW051380
	for <ath11k@lists.infradead.org>; Wed, 12 Aug 2026 18:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BTpDCdHVX8oh2DPLWNozYILl
	YQ0f211QbctU4RV5Ejg=; b=RNoO8uTxebvsNptxCwD3Ns0BjS7IEodYyNlciKAf
	PBFv3TMp4F6Edo9s49akYyP79KoGii8ogmQfP7SCbv5EBgZzM8RUSphkFbYJgiNA
	zrlbATQcMLuEd520TIyKqJQ1iG/kYyXg+e4MyCMOdNT2NdjmgdAB6PUV7+QVLN3C
	v80I+4BHI//muwfwug0CdLzLrHq8LjQf3sTIEJfgA41HMbV13ADjOP1tuLB/r9gg
	fNlpFZ1eAHpcqK8/ibaeEkybHhKbKmtIR6aF7wRxjlLZA2dSzBBClsS0K5qVg3MK
	sYl2E9rxZLA8wRNYPX/XDmkk9g/itU5cjsBYJcNf5ztdKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d2fgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 12 Aug 2026 18:22:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so17859251cf.0
        for <ath11k@lists.infradead.org>; Wed, 12 Aug 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786558932; x=1787163732; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
        b=J7w4y5uzXXoSUPXhUvaIEmdtpH4KNB8loxxbzeX/+y2MLdLc17EYnIEE/48SW1jNva
         gX9duaZpN0quBqVB+cpX5hNqiYOdZPEQ4oV6c0dzMgb7EC/p5oHz16JVE2QhiQtfOg7p
         ctZ85RKwkwa/c40c4GOl2Mul5FUS1Bb2lZKeXAci3lajQFNDDyJka/YYcD1bEI0V8Gw3
         AyAjQtDyrqBJog5TF1LzW9PHx3q8f9pNo3pcUPzeeRG3L1EY8ruKhPAZwo1Nz0ltrM+u
         dhX724JgJGrpgItssa45DTbLeiHlzBNXIwp3xUO7IWWHrzT7dXHmnHssm3SSOJPrE2I0
         3WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558932; x=1787163732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
        b=dckhu10iHWzpB+HVymLW5ipDYXfOu3yFZBrCSH0Lq+qmZEngtMJGuO916fBaYlyNal
         myu099HXRjJx6NgGVJ3wnooB7J1tt3ju4sddXYntwy+sG1+uDMk4tQk+57Iapcv1Cde8
         4Dj1KviUZqzOgehbbxK/fABPblGl2sPLsPLRPMMlkMZfGCOTYO0+iaLK1Sc7gOLI/unP
         jsMZz+gBT77c0H7IFPW6788lq0xg40eY1KjMH5pr2ttUC6YZHN7zmkCFs3PSR/J34cjz
         6T1enyIGfEbM9HlbqIlsOkEkkb7IjVRvDe4lAU8ZbUcwBHWUcF6I72NApo+qDDW+iq5C
         pVMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxGr+VtstkBTqdLJCruNX/oAhvhvf8jOdMjDZJDBdGF+Vo/EhIXymBi59sgCPkSQ+orYbN4P8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw04Va1D8pUHPPyNx7verUYsBgSvh1PvBxtvLfpsSTZLhGBZyUF
	cT3WZeG1kBapn1o+9sU6I+2FIi5RmmbKmhVzh0DNQ8WjZ3r5BTYyUrUr4QlnvqHQD8KQ+TQQt5G
	iMnFPKEgFzwVTazaKGcoRoFxiLbu32LUgcI6krlozV60r2tDAIvy5Na7/XX4iU+LC
X-Gm-Gg: AR+sD118Kz2NtFIbYAJ/T80HS6qxduivw2Mo0tW5ykN3xnb6ibx92NybztYyaSCfsIC
	3k3o9ev+Nh1L3w/jmrQxKYua0oA9OwRiaYBpfYBCSPBg6+EDNdYX1rHi+ymNA5UFrLy+bjtsZOu
	pMRsoUldaqsFaUzu7Qwrbk2YflGZieN8bNHV8DLE1vqOWN3GqI7JsTyEcM+hn8G4AMLdLHWAHNE
	R3L7yLFu6dqlt7hmZQbh/ennSQDc5qEq61HcDiSWIqRExDoIaQoPwbA9dp9QAp28XsmaoTRLBSA
	pEujtCzU85uJ7JvbdokG1lzJ16861KsE0qFA0BBT9P55Bf7MlTlJ7uwrVfXzsJAxxylId+3oeqV
	+RD62T1zkvuu2LUeBv6CA+jk4iq9iGcn24X7blgP6FSPPNdRk5m62sXZiZPl2Jl/2GcpljLTKqB
	HXPfFOP1TzjD9y
X-Received: by 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id d75a77b69052e-52d73df0ab2mr835171cf.42.1786558931216;
        Wed, 12 Aug 2026 11:22:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id d75a77b69052e-52d73df0ab2mr833301cf.42.1786558929327;
        Wed, 12 Aug 2026 11:22:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d0477desm659199e87.74.2026.08.12.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:22:07 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:22:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260812
Message-ID: <rrkoosnnkdkzgbqzfmpk3uwndoxuvfvanx2kjy7j4rp5ch4rop@wujgojy3qxxo>
References: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OLg4WeGpeQsMYMkGp6DVtXl6ZuwOPfYF
X-Proofpoint-GUID: OLg4WeGpeQsMYMkGp6DVtXl6ZuwOPfYF
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7cb9d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfXxzw03GJyWNCk
 w9+uk8OGRUvWflcUwPAeJod+Vb90Qos+rDSVCZi71owjh9ceKXVuSctvBuknlN/4vO/w9oaiybp
 SVJvA3gQP4H8PjS3SUQPhk82SYnkOLW2JaepdGcoZ/UP5lm9WA9x16grFO8hf6rdxRA/Vzudpt5
 Wd+Fg4eYEMgKJkeBkJ/8/Mwc26N61G7/7QHswj4ytY7Ua1L8mFSoXmdnjQ2/oWocaf+FCQ4ay1O
 oRKoCRG7c51qh+UtR0CrYUko53QCWIpekHG4b3D7SbdIOJIPaLl10QNZsH/Co0M6RHGfzTSF3mv
 giUu77juk/MymULfGHckW8lcb8AA54HGwtCAFUi7rjFWhENWdefMzqD+Jf4PTqpAJ5lYTiSXWJy
 BFfVhUw+queGcSGoSbBySRksUtNc2ndildiLqqOvGf/EE7VvOvnim7TgWzEYZPcSC5zvytnVk+A
 yluHNkGcBVNsvN+K+Xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfX5UapZ5/Y8xfO
 Sn5ES1oB9CBbARY0x/zldXvR+8croJtTaP7EHYUMzq3gQJ5FFiNwFuM1g5DXTnuy1Of+ZUBfc3e
 vDHFKMbqyuQ3vSCVx07XS+bW9+RbDlk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_112214_052378_529D9175 
X-CRM114-Status: GOOD (  13.12  )
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

On Wed, Aug 12, 2026 at 10:44:05AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> 
> For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1177


-- 
With best wishes
Dmitry

