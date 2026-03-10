Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7724FFCC9A6
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=; b=y1o8UBC1FCQ9pMVnrCG3I181dr
	JVudDiaUS2ARuXOsUtz1DmjqA/l45cW+C+rnZ6J4zXwIpNUZmyaXPSlebjWWvE71FCijwG/wHUpte
	zjet1z6kqtX9Jv7LrIOZ17OAzqaMP3WsflgKVkONv+Sc3GCUITSFMuvmHWed+e9TWtwrvUelMX5+J
	hVYVCAPX0KhmuiUKMBLCfEVCIUXsJCgxCpoUdJCQTQ//e8PoTvb38RF5hReYNpThrSOTTJK8In5WA
	OXQAKCjTdJORAruSaGaCUCBZ4U2/i6WK09xeege2dx9Y5BCHLCWeG1P84TuETk/S0d5S88jpEKpIa
	8tKdYZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkac-00000008Mk6-0u2J;
	Tue, 10 Mar 2026 00:04:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkab-00000008Mj8-1XUn
	for ath11k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=; b=gOk2bOQ2X+bSinhpeB8yWgn0fY
	PhwpGL2mClh6/fooHSfuGWdaNtwUCTc+0RKGRsBE2o9b2D4zyExI59N0nZ0GGWeUW7K8yfiTROhqK
	08lszR7gzHtDO87xReRZsOus1vsDLUDTWUqdRqL3EEh9Lo0bH8YZ8eY7y49Lr7dlVONaqvWs+b229
	1EHGSMBMMRyzsn4xUvSM9PFTzq0fUJCJD2VfO9zje8eYX3Zp0grWSZdourdiJeshygu9R+OByrbN2
	pK/lm8KfwqMxporYZj3ycrvQNjX0mxP2S15+c4n65OESAAGmhb6IFZlhhhn/+QzQ0nrNhPh0g8NAj
	3divHUCw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkaW-00000006nnn-32Tf
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:04:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBk1U1660056
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FiLdFIOl9PlXIMdxcVYmcXmw
	vstc2sRWR+kyhh3rVZM=; b=QfWNIKkC9L6ATOW8Ig/yhvIj62nRnrFOVe6u0i4i
	4SZ32G4q13/XjC6wjoBiX8F1pTq3XNepVaYX0T+oyA2Q9Vm3uK67nIaUFji9Pyf+
	ipBJ4RGGeoO5nDlAEtl1fSE8dMVjD79050LVrVqXE/Wa2IY3y6Bh1B+ZCb33sO3Y
	8XKi0FbmrtdoLFWScHZ6pvb0EVSLgjVdOh2eWTsoDOnWCS26vX8XHk0bTQGDg4l1
	Jjxjac5njC0WUG+OdkzWWBJZN/M7cvotNl1JQ1hBhVteDkljpcTmOXMzFSmrOMNJ
	KZhxmLXuEJU3I/67AV33kt7aK5/Xuy3rGFoZvqswBhG4NQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr41qfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81506677so1070734485a.1
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101078; x=1773705878; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=;
        b=UMmNZlkSNY2u7vL6F4UHFQ5B/m27CzY6T8+TPLy6BW48q+SYLOyuX4ceaPfp7wUP8i
         90l6JpkvMuwdsG5YiLEdRIfIJZ39kuEpMqHPvewYBgCorHB8pe24csTnZjIw6JQxXKgG
         ExuavGvJ0fG9vMSkN/6alAEBmAP9TBiM93/RQPm6Ld0EdbLXzyx1H14sVY7DmlByV4kI
         WL66p4XT1cTD11GElsdS80g4pZ0Wa12AP3K2DEg4pM7c0LY7dQEGxyjt8/4b1aOwe5xN
         hwn19Xv9UJA2DMJnYZJOUWBpALS9y++WlE3ss5pfEYZTNMkAE6LJDKRUd+XxWXgIDOGO
         GZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101078; x=1773705878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=;
        b=qDtr+V+NJW8mUe1I/LMScB+p8rsUw40wcIpaQXt0BWhYBrW9DB/CMiNUpu43kBE9dG
         vluYeUufk64SYD6VrGJqo4cIlJKHO9R7Rf/S3Q5QhyQ99t/2RHDm0Cykkbra4okDPYJv
         YBC8D6sBfp2EWoE2IOci+Ex/7700lDoqNJOKaR2XoKo8vyBxOMtzv284VTUB1CVK5zhH
         pxLHKPaPPYeUvj50XhY6JthoiIkrQ0dnDjHTW/2xS+Zjp7rT14DjKYGqYlFVsiiV9sz/
         phw0ExKkJgqFpI+ZmmB9fKXfbhOHJFLJJjglII1Ij1YwstTid5IWRACUqZh7z+Gj+XUQ
         2Ivg==
X-Forwarded-Encrypted: i=1; AJvYcCW4lf8U7Uzg8gP7+YZ4J8fy+kmm8ATLnbimx3xdpBofrKtpTs6qnII7B4P46Bqrg2tBmiyR3XQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeZA4fDP14uV2crZI+M6F0RCMfpnwoZxAdFKF1HxZoKECRb/DE
	Kc2vMvQoeCUqzvoQ4Kp2ICtlEGCtcgEF/5wetZt+rchAN/bP/zLAHmClfi2YPsGOXttgn6OGgiB
	XyBRCCrvM8UVnPAOJEw0wfKPhE1r7mZDK/j15zO7MaI56preDxXMXOD3XZDo6slVE
X-Gm-Gg: ATEYQzz2VxuGGYOyQ3w/gLVWpZKNjqNI+WifoVw5DnV/dpSQgPSXrDgYt93fh0Iu1bK
	rnJ9mmB3CbjTZ+CX2YoPe1sLC0CJxgnjokJdO/dZPBEvDIymZCkIHL1EBnQaXUtHR8qpJl+C9n8
	4Xi1yQEl2OqDGlnVwQw6SxwsWB2rJVoW+P9K4q4mhz0LEHcYw0rr82Yh4eH/ku+D3f98ZDhCIlY
	INPOvBZwxPIT0vAKwjZXGj+tkLQs2xJoPO2HbkCcUk9rPiCU4j+o/7o3cn/wvL1lhjfItPKHWvP
	0HwsbXpNhyCpbYCCt033kGOFcvFIwHxCkhLQpliquh1Q/FmXmtRG2PVG59kjJ621iEV+U669mMA
	LEncYpswnP45qTsIESAEv9XXT20gsjn4qiUPEixusAdcBv1po4pmo74tq3vZRZOnhxehX/aUOE5
	fkkSnVybS3iuqQxiWhO/40tTo2E0a9rrYZ6Pg=
X-Received: by 2002:a05:620a:4055:b0:8cd:8938:eff4 with SMTP id af79cd13be357-8cd8938f34amr639763285a.16.1773101078015;
        Mon, 09 Mar 2026 17:04:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:8cd:8938:eff4 with SMTP id af79cd13be357-8cd8938f34amr639757885a.16.1773101077459;
        Mon, 09 Mar 2026 17:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1139sm2074911fa.5.2026.03.09.17.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:36 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:04:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 2/8] net: ipa: Use the unified QMI service ID instead
 of defining it locally
Message-ID: <4py26yy2xkroj26amwxu6q3ynlvla5fmoyju7xu57ncgo7zswb@dvujowt2rxmm>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX0MiFqVfFCD6h
 l+TYU2nFNb+cpHDjPKmGppsV0zldd06cPgzek8aytKvPFWjkk6oKkumjJaM/jfeDhBfZFJGiZdn
 ZXaStxqwVADxHrh7D3Mi9TY9wZgj+Y2HyiirvYlGuvis+aELtYwQc/MG+24SEOIVSMalZrwt7cC
 E091KYEMn0ebh46ya2XTzu1ZU3qXFm2mxHOkIyrrLjsNSjI54x8lvRirAApvROxoh5WPbqydFr9
 +N/Ovo7/29rVVnVC7Zde1jiOTpved2gmlEGfYasT2HVG551YdttiACFdOodQAjSZzBjkiuMUuDK
 2dasLQxYCFeTx40MoJzpzG4xOimHsTJDleVjKj0k6nvBDv21SlPzwRlMQltiGdl4gl2ITNSzr2a
 3Elr/LHt1VO7B3iVeqGHZgSTzbASt1vOQyLeoQLBjAYRECjA1cLh8OfVzMPe5MgKV6LvOZktmwI
 1euVM45/MXrB2g/RPAw==
X-Proofpoint-GUID: shGggHGHj5gdbzXzvSC7Z8MlLe1Viahe
X-Proofpoint-ORIG-GUID: shGggHGHj5gdbzXzvSC7Z8MlLe1Viahe
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af6016 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=R5u7ATk22_IFkQxjSk0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000441_127034_77AE5D05 
X-CRM114-Status: GOOD (  13.15  )
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

On Tue, Mar 10, 2026 at 12:03:31AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/net/ipa/ipa_qmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

