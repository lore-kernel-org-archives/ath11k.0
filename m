Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9582E7314A
	for <ath11k@archiver.kernel.org>; Mon,  2 Feb 2026 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=; b=ZfxXKGuD1Q1u8YJzZZlta+zwLM
	qcdAKftTGRdodUyeOrpG29J/9M2NLV08TVzHMBB/KWfyXkyi72Y79nN9kld0VRX/fmTVcjEU7zZST
	VUw9m4TaBISNuFYH+yQ5KlLWtaKqaSnr3y2inJNjNCvKM1wcHLGkJVli7n8+aHOVdUgVhccOobSdU
	xGcf9Tn/vGt43xbDI5vaqK5DeAi09BpfUuKPitx/6xsJJ+G6GWteZMrwNa5+Cq90Zyz3tDKM1J2lG
	X/Vyd8h8RNbOINrjTeqv1DzhZtHQKzFGYFEZj0W+4WxSv0zUNy9bj0stHzg/oVWKG97DAQS1sFXe4
	LkSKlj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpy0-00000004gmx-2nDx;
	Mon, 02 Feb 2026 09:11:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpxx-00000004glS-2FTY
	for ath11k@lists.infradead.org;
	Mon, 02 Feb 2026 09:11:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61284SbP454603
	for <ath11k@lists.infradead.org>; Mon, 2 Feb 2026 09:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eN8FZFV3v73ds3IElQVUqYG0
	lD7MUuBen0ntV/aMJC4=; b=ZywOnEcTXNX8O6U/gFHyjGPAHh21W1ZYtNX5cCOl
	y1oEsmRmdpW3NVh8VWprqk+5YEuKZL4pRJlke49qeaIGFuWpOewn03uhKLAqLTRO
	bThBjLOysL+WNYO6W0y58AbgBi+gOZT8+O1naZsDgrncCCYATnD5b27Vfc2fuo0l
	hCnlQc9aU9Kr4sACuoiBmZmy2LpLF2L0RCb+XsgJun1nKHnbz/O83eI6j9m7Tk7S
	gkJWT8+aRjDNcO2kcMYKjqHGFzDWFPN7gGv9zBQo8Ax9aYUqa8C0dn/amlWore8m
	l684gd7dMNEW2aXDlY+Rj+1S1oL3KeaRqfmWvYFN7Sja0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arecr5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 02 Feb 2026 09:11:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a291e7faso625962985a.3
        for <ath11k@lists.infradead.org>; Mon, 02 Feb 2026 01:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770023487; x=1770628287; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=;
        b=IcgKyyiQGxROO4WnyoFILmk+BKNB8kaj8+UvdP0k56zHGamYvvmiOTzNtk3pwM2Y5P
         8BMHh9BvB7w5UGReZPTVDQNdo+bWWGCvZ6AA5zqr+Oo/sFaYAaF3R53pmPRKRXEUnp41
         uFBMD/ffWYr1JgVs/OH3iDxSy7gXqSIK7zIxZuD+hbIgxPFhW0CShjOtjtAGbT2AKG33
         kpe/GEcXUO6Z70e5it7uaax76w+g5wI6pS5Q4rvEaA/6CR8sBOHdiGz6Lkaom4Fc2KWf
         NUb/GjNw2jlQa4cLw+FDEgwXotSANxO4gmI2KknzmocVBmJlS8OcbYiXDbAkbd4ksGwd
         7m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023487; x=1770628287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=;
        b=jOFjrO6MHURr/w4fX7+3eupcn3SjTADb0PU7JNsg5ilMRtD1PXWG0X3/2Rct3Via9u
         Wr760M8+9AuQ7fvJlDS1ceZySr7HgWDHACoTwnx/3kY+BCiLiv0b02R8fkirfAu/LSeg
         UpQCl8oxtVTguJSAEggUo/BetAW0ADfaVsxlo1HI+SWeGzpcQ6jfgoJSIi79r8yypzhI
         pNifZ0twFuM3bsHzgFFe57s6evoKwNKya4esU67mOdjwwWHESUwKbfAJ1N5NA2S/vkQd
         FU1PAGlvqUvGWd6lEXlIn+pemFkztSN+0Nw33Gk7V8NLnNuqQybdJaBOYhUpgzxH77vO
         Axhg==
X-Forwarded-Encrypted: i=1; AJvYcCUt0OsFX265kqvbklOjoTZw8wQ6+eJGpSvuH0hQLq5pVbSeAI9JULMf9HfOBPFtqdWxoYA+2II=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwvr7zBIuVuXSesBLgu2YJaMrfMjZxKCejQ5pCrGirNjLK0Zvo
	vBXhoL6Jfl5PH3g4XWX2DbUuODzuiDMX9+zGSEuJnY123AqNBBnhFwMolBGYsC5zidGhKoG4BBF
	6LRoQttmjk8rzkRFSFTh27+zVn9aZlokXoexIEDcdxcBGPnwTWeJuIUSMP33KPwNW
X-Gm-Gg: AZuq6aLzt9BuUVQaL3F/Sglym6QUlmQjd1daHbJmVcrbEomcfnpEKVWzuv/XHmz+24Z
	ZOCEx1yIsQsSSulhN28gaZSxKIWHz2DGkoYcgPFxu/9HELRS2eppWJolMcafhEoqEdzoQrA5H1o
	UI0Mx+qZ5yHWFaqMlr3sNBlISC1afvMb+DOhAc9jkQ3cv0rXltZ+lSyjvMzu2lpGOUncSecqy8f
	Apvjr5sa4dsWwu9oVJWc6APeoNbx+T7VU16veU44/W/UwOLloqV0xlfpaZqzLCF4en3vi9vPzKk
	ShlmBVc37vFmRCpetltmWXh96BXCbS4tomWvA6sTcmv49cNxov4ymTBOV1guqBzOJGcFazDsoW2
	tn3/UQ556EuWd+M7n5zwaSzQam7GC/uxinYSZUhMt01UKlAn8V+PnDyK+1jCT+YgTON0ovekiCs
	Ix6KuAN3riXM13LssRJvF036A=
X-Received: by 2002:a05:620a:2197:b0:8c9:f996:8203 with SMTP id af79cd13be357-8c9f9968266mr808623485a.13.1770023487638;
        Mon, 02 Feb 2026 01:11:27 -0800 (PST)
X-Received: by 2002:a05:620a:2197:b0:8c9:f996:8203 with SMTP id af79cd13be357-8c9f9968266mr808622585a.13.1770023487206;
        Mon, 02 Feb 2026 01:11:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481c22sm3401897e87.10.2026.02.02.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:11:26 -0800 (PST)
Date: Mon, 2 Feb 2026 11:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260130
Message-ID: <cwzz5ndtvkr3dqn5xr4erfdhi2pb7xjijcu3c23pdpfgnmlyvd@nuvbtkakxile>
References: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
 <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=69806a40 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=2b7Me9ADDCpIAGoeTPcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6p2D8NjEvyc9GFcd7SIIObMaDJipysJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA3OSBTYWx0ZWRfX2k/IhhqkvGME
 7mp4lVkWn3SYdGLgo/ul5Q1Kew0ipVa+VFloWacbebP83W6yNTLxeotj/XkvicquSUIJW6nOhpg
 Z+mAL7RQtb6sSenyf4PBxDNy5xUYck215h6QIjpT0dSDWcwjltmuWuXIhIdJeMIDxiTviPctFPh
 oOY53Ph0NY/n86l3pUVqG/0A8g2VXlL18xGCEuwtIsS0Jp2QKqL4459Zx8J76zG2CFpqkDJplcX
 ACwNB9icsjkINsYRWqlK8cn5VVCl6UmhrHnFqyKPCq7A7wQPQBWCCGU1rywLclkX5xVaAu/tchN
 6yrAqPSiyEdbSLYS4UuucjSqiEqlN6KGouzglXEAyN4x4cAoz1j/i/Yytk2KEyNbELxCvzFy9RN
 q8uRhJrwZCQq3nPwrDjyV0Odk0vQ/AZknvuNErqLpdLpscKwglEF+NzY2OpDl5KQlPEQT/QIXkB
 HISvVeHzvzmjgGISFfQ==
X-Proofpoint-ORIG-GUID: 6p2D8NjEvyc9GFcd7SIIObMaDJipysJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_011129_811877_784D6FFE 
X-CRM114-Status: GOOD (  17.88  )
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

On Sat, Jan 31, 2026 at 08:39:57AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 12:29:48PM -0800, Jeff Johnson wrote:
> > Hi,
> > Here's a new pull request for ath10k, ath11k and ath12k.
> > 
> > For ath12k:
> > 
> > Update firmware for QCN9274/hw2.0.
> > 
> > Update board file for WCN7850/hw2.0 to support:
> > bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
> > bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255
> 
> These two were not a part of the previous upload, but... They again have
> board-id of 255 (unprogrammed). Why is there no calibration variant?

Our engineers clarified that for the PCIe cards with the programmed
subsystem-vendor and device we don't need calibration variant even if
board-id is 255.

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/899

> 
> > 
> > 
> > Please let me know if there are any problems.
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

