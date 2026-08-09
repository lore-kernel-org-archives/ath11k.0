Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8197DC5AD4E
	for <ath11k@archiver.kernel.org>; Sun,  9 Aug 2026 23:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=; b=iZZBYG8LbcNKXJfuyhD4CDrOMP
	P5I1TXIafzYA2IXApve4AChU8q+O4bvV9BJyixdpzTnQNIgMTIXYnCu6xBuQmdkPC0f8t5vEESKPI
	G0mFaBLjCNkk510Sv0bf+ZLieUQmL0qYfGFbmRxbUBF3vrr9G2k6SenYwHZrBbJ9a2LdSI1xmREbt
	zC78DD/fRdYELdGsFYgApwz1qYjwvlcJlf0bq2yoFFn/nfurziUCliOywFHZzXBhmfcb4K58t0U/t
	3mPfD8KvoYVNOTOfYPExAEzl4KHuV2bSxbBRQbmiBbIRHtfbYn6vB7vaqbPVfHpUxyLiSizanRgz2
	ltJGD+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtCxk-0000000ApT7-0Xg3;
	Sun, 09 Aug 2026 23:29:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtCxh-0000000ApRu-0VS5
	for ath11k@lists.infradead.org;
	Sun, 09 Aug 2026 23:29:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L8KWh3050963
	for <ath11k@lists.infradead.org>; Sun, 9 Aug 2026 23:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MgifLTeWoPs7xR+NoGmw3cPD
	yJjBTZUCzAC0a9BDorI=; b=pg3axF+Hfg/EcnBJkRW7KwIiDyxAwk8LUfQjgKPP
	egMjGONOwsURlCbnafIb1A3SLZMngJxWpEly9lvrnFWRQwtAL02CDxQLDYETMmu0
	2LCKQrg8s+wq/+P6pDGQv7D8fGhk6/+IpgJm/omRqFID4jq9UKrHh2Scz+cvXfkn
	hlYjVdJ1yofirNpuz5DcNfekL5ICEe8AZ1uNsNgpTQbjNpw3jGvkxh+7ns2FAAGj
	aFBdQd8ph+Xa3niJiw8IlWlBrbXJOh+c1iKvkuXyMZIMwHeeXwxCOBg8WhkfTbYM
	ikXaJpf06Nx3MuZLuKzeWbPaROmi/XBUpLDjQzthBonGVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgumr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 09 Aug 2026 23:29:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so32326991cf.3
        for <ath11k@lists.infradead.org>; Sun, 09 Aug 2026 16:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786318187; x=1786922987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
        b=DnBAbsHSkmSmHVYm0B4xQ9RFAW0mJLO0/+N9UPQ9AOFJdRIGwnWuDudzJgebFamKRA
         HRSKbfHro6bb7lB8qNY4/SSmW68k1PzCdyfFlAgEe2r74sWbVrfEpBGk3XBkaoGiUYx4
         hpFZtLi5alUfTeFd9gC90zYibV32XsTKPiPXUtoTaSJr/rla0gRTXUUx5cJdAcgOcDGT
         vmVgLxRUAGkLxgnKxgs7Uo8VS/xO7pgb95bamjpARRzPX52Q5phrO4jjFTjd0iL+g+/i
         HDrgav+wvDYld/Ah0yrccRNC6YP1LqDe9BGOwMEN9sENLxoCdgo317f+gFPT/iwgNlVh
         +SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786318187; x=1786922987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
        b=Gb8Ivm3CHXCs7a/slSf3JU2jTOpwJg2X+cL7v9f5dSsB1bLbRjo6XBnls2juycY3MB
         EIOlgv6dZ/Inxp6jLlyQgOMlQ+0sZxtVoSA2jL4xX9kftJzgu5yJ9ERSZmx2rQmkRyX8
         KlUNtqoCye1PPK4XiqnpGlbHT10R8c5xkp4KndUhbF/6VjPWtM2UOM/ZUupFZAPGY6/f
         ojBEaU7Mw29gysbd2bZo9dn7CHT6uRq8eE75OGtbj0csWbpqGr1y2m2nblN6qUEU+bff
         bwm+kvsTJb5faK2GyCXcEzAkxSvuX2tlmzF9b3s1irdmpB9N7PZxpBg5nq1WmHgM9bsG
         +e8w==
X-Forwarded-Encrypted: i=1; AHgh+RrBLtwpead5jXXsv4LerXCHjA+PD3zBZgfFGG+Zg+uF1HHrJ/3mjRcXKu5GDmtxefozGbnS1c8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGPFW9oDaH5Z01GBST8D3AzCriXyB5S3F6sG4Rcio5tQgDzm/q
	dpLwASBknQ8vG8Pj6LxIUcqUHe3bE1mDWR7uGBUIB2wMsr4BEYZx8gIXH+nTXefUvQOBaqg69JN
	/sU1l4KwGUcuDXEQMZVI+dG4HGi2WcFCyImpa0u/oTOwZC+sgYmseo8aYvYW8HP8SGcxkArZA
X-Gm-Gg: AR+sD128t7pi3xjihPouhGenFzbbacbTN5cX9GNwrkCMLn/eEpTOJZykSMoH8AVWr8a
	MIZlL9BNzPpKunuZBogyfswhw9CevwtV74hSos9ns5/u2PnduE0Qb+xGWfAO1YQ+F93O+0S5lkx
	SMtrQPXRIRkTx6YAx7lv0J2HdDaO/WMjTcklvT0J+1HN1LmPMJwJ6gH3DNtndfukZHADhBGK4Tm
	xu9T9Mg4x7ASzaTZ9zSqKss6ObabJqf+//mpbPsg7IpvgkbsbZpmf5FoE5v4DX3/ozH0UE1Bjc2
	yQXxD3y0wChb3ukzaz019kYw4RTu3WGJbO+C+vFEMCINEfLFU6s+CBFdEgJyKwDkSZC1rrS8NXA
	ObOHuzz8p8hneJXaJPI3UJtgBWXfB51tDC4iUf3bw6K4yQpTZB/kQC3s8jW9TvmGwZ8n7cpThrA
	ZXnbrl+at6AKLSsA==
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr180714081cf.43.1786318187233;
        Sun, 09 Aug 2026 16:29:47 -0700 (PDT)
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr180713581cf.43.1786318186682;
        Sun, 09 Aug 2026 16:29:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050d011asm1631111e87.32.2026.08.09.16.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:29:44 -0700 (PDT)
Date: Mon, 10 Aug 2026 02:29:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260809
Message-ID: <fj7srjlprwhlbgjkk42uafcjysulte5lbw342tnultbhyijx4x@yxsgw6awrsnw>
References: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDIxMiBTYWx0ZWRfX3pcJP+fkCP0o
 QDrh/RZeV6J6lDgEXKpxqBpzudhBBF3jm2WRP9gtbwVjPaz9kq/dULBnV93/65BqyCer6wYN8nS
 /ZylbqlwERIofmxDhFb8Vhfd1x8goTA=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a790d6c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=Cll3ooqCA_IsHNaTrZ8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -5r-kXrW7GvPwhIokUfTrnQU-VOaAwQm
X-Proofpoint-GUID: -5r-kXrW7GvPwhIokUfTrnQU-VOaAwQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDIxMiBTYWx0ZWRfX8uLCpIibCLGe
 zEEGBh38CGSNiolab2a7thnzZK+OuDDNrY7CNdDQw6dh8c4X3xDF+X7b4IJEo1m58vcQchZa6Po
 95icZaR4uv4Noc3N8diZV2k9Nadtrj/K61a0HBj5oyeXnT3WApevGqACYUHvZkYPxdeuANhJH+F
 XylGLv/4ZB45wdOW3lWCGnRS0OmOmn1dZnRIVqBAkopvwa13v5V7de+SCCseURKHDlnriTUAebB
 BDnFnxBT7UTe/60jp0Df6U4b2tGTP0AgCeMuJb+cHXrXWT4ZFRKVRQk1Rc4m0zH6FcbQC/O6X6O
 YC+O8Dht0flnMA3WD5n38/MWAKiLqoLSUUEQgStGpT8GlZhh/aoyrgngSzsjQXUTydaNrW8wBo5
 GUvsVuw8lmwkRWpCgOZ39Bl3EuJ2AOlXKmA0M/yo7vcfbC0//IcYFCQs6CXwPKq1fyYUWqNO+fL
 FAGtKGiufmQW3D1/A0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_162949_254853_B643034B 
X-CRM114-Status: GOOD (  12.04  )
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

On Sun, Aug 09, 2026 at 09:56:35AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> For ath10k, add board file for WCN3990 variant Shikra_EVK

Thanks! Merged and pushed out (for some reason it was ignored by robot):

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1171

For the future pull requests please consider including a change log in
the commit message (so they get recorded in the git history).

-- 
With best wishes
Dmitry

