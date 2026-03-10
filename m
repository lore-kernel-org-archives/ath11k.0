Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB141FCC9A6
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YVUDtYbGk40peP8Fv0PhsiXAN6JtNcjR5HdQiC2+Yw=; b=auCIMtcJ6lkbyQkSNuF151QMqZ
	K9bQeXmtlmFJQpPyRginTJPvnA48i/RizeyXQOZwnREZkYcqxdDOKsjo3LDE3k+Z+kBF4JSzA55Tc
	KqLn5FaFFYPmz4vQxYNHNXSY+v6lO2X1uVxYVT/zGBL25W+YCmSHEhFLRK0fQQl6zIFtCdkangHon
	UHkSOB5weVgAYm/4yKFdBRo/4Zlfrv2FDnJPYVwCNXej0cFABy1ux/I1CjUvxY+NUERYnkbsTrILL
	tNnDZ1BRjoFax/Uux8kZfgzoNFwOUx9a1QvD4PDtpSESaCNjOZOwkCD9XhW7tm+FaLsEn+tNzM1ba
	GRzniCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkdZ-00000008O24-2rkx;
	Tue, 10 Mar 2026 00:07:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkdY-00000008O0u-2Oe8
	for ath11k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0YVUDtYbGk40peP8Fv0PhsiXAN6JtNcjR5HdQiC2+Yw=; b=PoIKuaxt6Ydj3uMBHmOyBmb3xQ
	J99dQFoqJsDVgVLVkJ5CboIUYawU8aPfy5S3zQXjOp+mRNkYb/Iwav1IpacF27jXkI2Hi5VAmjlIV
	N374IB6ZugP/h4Ser1zNZA5i5OlTrjTP3954ivMx35wc6/R5A0QSRIXetir4+oWfk9yYL/sN5MBUM
	JvY71I4ulkaR/Y+q9DTauoA1N5aXc7q00e288VcskDHHDGIciOeFcr1mgFo+iP4eT9usH/AGKJlBU
	AqlhKii3a9buLYVkiGnnSl474Stce5eA0OH602z5eh5d7pHf27CoVst27L2YOvwXEBeLCAvfy8Rzw
	aDG0FS6w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkdH-0000000DNxj-1vMV
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:07:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCHib1212393
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YVUDtYbGk40peP8Fv0PhsiX
	AN6JtNcjR5HdQiC2+Yw=; b=YBGRUKGKp4X8kuGY4wfe8um+rTtWTGXrWmBCm52/
	YmnC48PB8jAjc2w72djinZqmLw97ldx8NF6Q13KdgcRJ6+HFbkkI4HC3guATJU5R
	A1RxdF/kCMTwlpY2Ax+h5ouzuSE5BO6HwVGwZkrgOCJJtQAmbocjM2dz7QkoVZ/0
	53X8aniUG67zMPK+entrUHtLZcyJbPcCarxm2CdbszkI8t816M7214oDk6ol//qU
	QBqlJweYj/i2PuvKGFhQbSukSHaBK5cVd/siY3kcP67fHvPVPIGWnwohIentLOgB
	0bArccSY3c0DAe/0pC/Wb6tzpXIzsQeVlZfaMitsAKN9ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj526-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:07:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77502295so1443167685a.1
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101249; x=1773706049; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0YVUDtYbGk40peP8Fv0PhsiXAN6JtNcjR5HdQiC2+Yw=;
        b=FI9rdMDAUEV+dqL9Kkj1Ti0NQfnQvclzK9ujufsKH8U2uLZQvb1yPXr+bVyZPK+Lxb
         eU08e9ksA45PrzqjTgueuj4twGQvF4Eo3Nimi+eTWua400KC9ehhJgmlQ8z+Pm5wWTMs
         3r9kANz+ZkweEcqLQ5Nw4XoDwMeFgklZmjhqjkPSetuBZsKrVC4V1b5/Sy4lWSmZN+EZ
         RFuGLjarIJVznisBvBFFrQ35VQGw+t4IJhhbq0+6PSLxROZGK71PifF1FlEbmru9iEcT
         2nnaIdcDbUBzwzaPhL+T3Fzid7//a3F5YXja16ULgiTTuuzRn16rFuh86/ar4VO3UGTP
         degQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101249; x=1773706049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YVUDtYbGk40peP8Fv0PhsiXAN6JtNcjR5HdQiC2+Yw=;
        b=PEnhKolSdLysZemdKdvDEibds7XuEjAKhAv/fi8vP1+ujX9LZUnN6CbEosen1uD7os
         vvTZpTa0B9htfJrTmkOE9Cts31Q50blvz+Xu1JX/xCvHLb+xLn2S6FWZ1gclXr9iyOPU
         aSJe3hejducKenwy508slaeZ6cOIdT3bn9wTZkLwI7PpmkvtDLqlmwEPwQhFTm9aW/9n
         WO93EcmQTG6r1UiB2ioXJtGn35SwG5xo4ViomOzCzPv9uSj59TXcKqlrFj9y0TFHZST6
         PmTXw/WIMSHtyHokNC+NNFa8TrlfUa0BF6se2je5s0+LszW5virkIdpXsXSPDQKbK8bN
         mhHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqH4SDpgTMKhmvs79yMXQHlinRjYDeeIE4Vym1+XdB86agFIud9LlmkmGd2pUaZLJj/KlASgg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrP+KRyxKN3L9i7xvmM+5uN8pWxeyJUWAgqpltr1jjxsxRQqWe
	LXUEBQJ0WDEGuHmzc/SD+4crw4iBda+PQcwLx8C8VUAkRXavzoUmZS7xnYjZ6RV4GCMW/Tc0Q/c
	k0IDpn13uyYnabfNvfcinCQcnxpJHlV7m5QCw7BDXY5O10kDqROaWaEhD/FK9oQzw
X-Gm-Gg: ATEYQzzpvNq2eRmDK4KF3pX1eCY1lkn5Xq9pOd7/iU7zjj/1SrIU8Ni1MPBUBNAQa78
	G9B/yLqWVo9cIrDGmdMNu7jqgJYz0/SigFjSu0/nFAtfJmnFWuWp4RfWoQKBE5NdbIflB+LjX7m
	ba0AtMCaEuSVLfv2gORMx6PAgKoXv0VETnCfN9v2DxnAAAkyz9uFqXEbAfAT/lbJ7rCP9mgve/V
	1nE15JmGFbuObwuuG7J9AlE77ZySVaQ4fMGpVrgaiWY6R1ntMr5Yhuj6IYdVbRCRkYQOs8qcV3f
	ihI8M1wcnR08TmzVC2I6o/Mb29uECy0gTGikNlvYOLlWm9IEYsXgdjwMWBlJjxaV/BTUaq1WJdT
	sv28Ddi1kKjjh/7v1lhWoC5FAZuti8cTWT7k1yhy1l/Hz1rVAQnYgwXjglyo6KXvTyS+uS6cy0e
	M4IoUUXukLdJQT7R2n0p+nhYDBP1lPCzMnVGo=
X-Received: by 2002:a05:620a:4495:b0:8b2:7558:409c with SMTP id af79cd13be357-8cd6d433536mr1656408885a.36.1773101249448;
        Mon, 09 Mar 2026 17:07:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4495:b0:8b2:7558:409c with SMTP id af79cd13be357-8cd6d433536mr1656404185a.36.1773101248996;
        Mon, 09 Mar 2026 17:07:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d086159sm2355811e87.66.2026.03.09.17.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:07:27 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:07:26 +0200
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
Subject: Re: [PATCH v1 8/8] samples: qmi: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <b4didhxklg6j3oqjhpjw474j5ces4qgmnyjubgwmozfaoua37x@d63ya2n5bmcg>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af60c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JDd5jbiArqgbxbPHNCoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UHpAqdiLNR3yFXpFG-7uf3LaT7VDoc4J
X-Proofpoint-GUID: UHpAqdiLNR3yFXpFG-7uf3LaT7VDoc4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX7xV14jpSeY4J
 j6hdHE33Xk7z6TfOxQdLnX2ZLEC7k4W3wz6D3927fkl2A1btaCsy151obasXuIgVC8TPb32HdpD
 joyLFhq4H+sF7cd/MJGvaFRZlzDGIk4VzXezO4XDEgv7AglVZwL4fYlxr+A8TY/i0R3v6f9s1tB
 8fauwLayAubDB+m8pX5MGoRteWtMTlzS/wNgs4HfwRFE7Z809udZ07MOrhJvyqecD3cikI/9YHS
 Nq6ymGsYxFzKduKvfFhs6TUXd4a+K31jnVdNmd4y02C39dLHRwzD1oLfXXIZqQVBEiKKV3cs1if
 pZi4+5H/lK2ucSBN0FP++T/ABjsm1RyUbxLSxMCPMFVe7KpeEnkIo86SXt+AxSruu6Lko4Qatx1
 G0ru/CAz+SaPcAHax5w/RJooxL4c8yZW+F4G5N0Gul0nfqRVQPJPtRVN1r8Ktm1yO9vz/2Af3p7
 Q4uwO35ORUOHSWc8R7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000737_803837_D5DC969E 
X-CRM114-Status: GOOD (  15.52  )
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

On Tue, Mar 10, 2026 at 12:03:37AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  samples/qmi/qmi_sample_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

