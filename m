Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ECCFCC9A2
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=; b=v8L2AT5elZ2No8YuQEQveQ67i0
	nOmBQaOmDMs54ySICwXmL+iwcP4zfGrOqHN9e9RNphhVrI1BV+koB308g3ObzTbUMHab9E7o9B9n9
	AHAvRGhwdrN3yRl6mznNHq25Etg79hzuN9fVzV5I4WV3esUJmmQQrK+KJoJKH2nLQwLcO78dVUYUB
	NNsQDuEmT0fWF6Th3wOYPUbhzuT/w8k+UPyqRjbszk1HHiu0l6I1U+nPgM07lODB0z9litAC1dWiP
	LBWruzulwYPhgqi02TMDBpTc/wu5K+refpeDSRv0+cpIuTekjo+B6vpe4ve3LhBMgHLOtW0q41CwM
	RFc9TStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzka7-00000008MXk-1soO;
	Tue, 10 Mar 2026 00:04:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzka5-00000008MWj-1nyx
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:04:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCHfp1212357
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDBB6MSWvIU+uCb142BM52FL
	425T3hgvc07Yy4sfD2U=; b=nZkP6IpYkgOyZjCtuUwwRI/ObSj6aw7Irq10/R97
	PPiuu9fKLJwceK/Xpa/ltlNYRujyeGcThKXjnd1ZPj5BOWnCNOnOT+tuwIqX/9kg
	KPHv56GsLwKOToA1ScWSDHUqqWofqSFma5li/xOf+VFsbJXzKPscn2meX2n5aZsf
	XtSa6ak0iWjrflH7/qf8aiyE2D1I5OaO4RYJrfzuX/e3VtNDkNowVusVOqEC87Nz
	wJ5TX8ER5EDtnxm7bXTGnP6qHbg93W0JM7UpnEpZ2OW0EXBM4a3Wqe4flApHSn5I
	uOLdhni2r/07ThP2hR/CEJLCeB4ZAOY0/M80kRu9WTivcw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj4hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81be6f05so1122701485a.2
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101052; x=1773705852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=K3x8qO15khV7/+sEPJutBCcSjLc1/ICay0oYxFYnPlkiVopGzMXhbocsG56CPv/ZWt
         FpeHVekUgPxgoiKb6ivceCzg6hN/LzjUx/z09RBbqOPKXZGq/PEgDNV6pUGSCbFzniEr
         rom5qKpYyff/kRZ7o9u4xrjarmIhoTaRJEPwgoFEh41SIG8+HqvhiIeCTRaEPHha+mu0
         +N6rgFrU+lf9FttB7RM/DsT/BR1xikh9wOoEV5xzbG4WX1EJ3i/pAc6fVVRNkuCuTpWF
         rbdFYGswxFSkyqHQ3dOiRZ6BR16q7sY3pXLZzLJCLUMgqjLjfZtSHsA1OV7GiaF+JCQe
         tDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101052; x=1773705852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=uKbq0Pftkeo8uucq1ui4vTtMFaAGaTkDoIiMGh9NiF3JnXW96vka7/xmOTDVvcxW0v
         JYvv4gnUHS9xTyt+nwayzjK4rzrSi6xJzmUBiet8ceztKTk/yFkm/Uu5kpfAX77gN/z5
         AyprlUtFkLyDAwH0JHBeWwY0yXh4U5CvKMZrv1sDD76+uXRJxlmcy5dMM+F2wvU3IUf5
         DqhTYbkp6MvRckdrR06K8Ncxffx+RdXbx28rT2/Z1EgfOXEwCTlSiVC69UEYcm8Bs6SP
         k82SMNNIx2kIxPk9bRnq7Ixfv0k2ASv1sDU7dIT6Blp77SLIjjXj1lMecpeBgFQD79oG
         cQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGs/LAIikktCj+9lHP39oMCR6J+EjpzL/7Z9iwD8o5U50hnWp6FZvWZgCOcWDMpQGtd8RKY7E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCDpi9zs1CMb54XK+hzR3W1OE63Bgh3lQCEAajcoibMaIssGTi
	TMALx1btX+fno2HiRrpnAd0CMOoATz3x/nMe3kPpid8XEItYAGcf13qKtnCWqSR8XspdIR8eRki
	7SFNeRr0s/QE4Va5O8qbp6tydcMaNSI+2u670tD9lo/lWElE0lij8CN3rUNsLzNEq
X-Gm-Gg: ATEYQzzVVqlqb5zZBvwH7k09YSSZ400MVCJkzXBiGuuBFg6Mn2TOrP95bL2wHhIiorU
	JkOApDsBdt2d9+yLxL7kMYQBPRwq/xZGAdYr9MBZWhAmXI0JIwQsXb5Tz8aI4AvYD8l3tuZFApM
	XyH9Cj6B7Oj/TMbcigzjlKtWLEroxQbpbS3QzwC6zjjd4FaBrnvgC1QSiD9yz1GIXZn6FmxKB2n
	nCO14oihp53QH8ZdrZUmJZSkiVLByblFrMEpo4Bg7U55F1tdtlYvwpPDGM82u5jC5BaHwnRhfY6
	7lpjamHdDIBeeJKvpWS7zLDIaJX+aX01RU3Duc9RbSMuwYqrIqS006PEpSzEwvYoYS0/6ukDKFz
	rv2bX1VBFd1c+y4kt06W6vTXwfCue0qeYTVe+hPtigcqEv/1DbiQWMEPMt5hxsbquj7g0vRNNDJ
	STUHSRqQ+dcxPo1zS3r3BJbXm5V8nhCKVceQk=
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634215985a.70.1773101051670;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634211085a.70.1773101051178;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085ee3sm2378748e87.62.2026.03.09.17.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:10 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:04:08 +0200
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
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Message-ID: <3yzmnaovl5dwhxc7r5dr4pjrvcqpmlec5vrlzhnj2cnpobqpq5@uvfiuyakrg6b>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af5ffc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cjxZHsy2hmLZGnxokmcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iQHCb2pOIWtNVoR9g9SZcGkPgwayi9rt
X-Proofpoint-GUID: iQHCb2pOIWtNVoR9g9SZcGkPgwayi9rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX/Tz+SK4bNbfD
 rnq2YEPITgMHLAyUhOiwwZJFcS/kxLUiFB9CqV2oAx8koAVrBPqYwubf70EuxOx3gYuR3MD+rV/
 hKRG6cE9u7uok6oXt2NGfwVCOwXY8XD3tTq2VZyBrRh7PxekZHF1MGg8up2KUj8/Osq+4gwffzi
 ABBOUpjFf0HgN5aCjd5fbIgNFGcB6us+ZddoRLIiGXrStE6v+wjFf7BRyH8vPZY0pa2bNhI7ndC
 znp8Cx5WILhXrr6MHSYpv/m46mY6kAXH0k8+rIfzGeG10Kd7vm+8PFlzD66l9SIQVy4x+2adX8H
 gYTz4H/QTJKLRohB3P3UJX2qMCHllTAMZIiSUqTQDQNaWpoaXaPhbIBFdiF9yVjqRGEE+yGMTSo
 cqfPV0PewLr9cxC8lATfzR/bYCWbcSwVr/nXYR4DKsGqhGPg3wM1CunLhaHaCo3InY/ZYdp9klQ
 fhEKvGLj0L3p/2bsEGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_170413_579696_F78C619B 
X-CRM114-Status: GOOD (  20.15  )
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

On Tue, Mar 10, 2026 at 12:03:30AM +0100, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the

Nit: see Documentation/process/submitting-patches.rst, "This patch"

Other than that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

