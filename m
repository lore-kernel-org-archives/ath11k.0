Return-Path: <SRS0=8Utr=GW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,ZIPFILE autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912D2C433E0
	for <ath11k@archiver.kernel.org>; Tue, 19 Jan 2021 19:50:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF7123159
	for <ath11k@archiver.kernel.org>; Tue, 19 Jan 2021 19:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CF7123159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C811T7mdboswRUY+N47GqF9AoauFpAvQbrcnDY/MJOc=; b=Qv9SgSnLeBvolI
	hHC3oS1JhlIc9LyKSzABX/5v52fInTCOD9TmxLIGoT+LrYGirzKyphmIMatTY3kwqU09ljRj68xpF
	VgI1Sz/CET/WEy1QxSe0UjQnF223Vn3etgzYux7RnA27Ti07f7pVmeNNkmcy+EnqUTpBlEkQ9gKGV
	AejTdDb7QohdAUOixFx/Vah+Iw50Z4t6dtd4mYLNk5YPpvRm8ch0EVvzCteHc10OcnwCIv+/V6dmO
	1zan/5Mj0I+IPoYhPcUTmV7Ve0J5bTOZ1P0pQJ69CgABiO6y84o+b6G853cFS1V/zunKICsdr0APh
	1ao16dmp5MoVmKw4w8OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1x1T-0005sD-Dj; Tue, 19 Jan 2021 19:50:39 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1PhU-0007Om-0B
 for ath11k@lists.infradead.org; Mon, 18 Jan 2021 08:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1610957747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rY7PbprYD/2ZBdLgo6AYm5CUBNc4PfR4mvuLlVJnO24=;
 b=YYWGL+WUtcZ3NLuqQMSI+pvO2uE/tn8mEoX/YV1S0eHNTdIHS/7+JNAQXKW9h2IEzbYplo
 OFzI/pnPAmoEurlXuWy23fAPvVVRlqpRFiALFXTjSLha5XtzKQDjpW65e5EZFXpB62CDaK
 PFQ/3p4ioW/PRtTpYP5tlcsGWEcE3/A=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: Re: IPQ8074: hw2.0: Wrong mac address for 2.4GHz PHY with firmware
 2.5.0.1.r1-00004
Date: Mon, 18 Jan 2021 09:15:44 +0100
Message-ID: <2907591.ktpJ11cQ8Q@ripper>
In-Reply-To: <12396947.EVyyLHbfrO@ripper>
References: <12396947.EVyyLHbfrO@ripper>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2133046.HovnAMPojK"
Content-Transfer-Encoding: 7Bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_031548_262284_34841A59 
X-CRM114-Status: UNSURE (   3.09  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 19 Jan 2021 14:50:38 -0500
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Sven Eckelmann <sven@narfation.org>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.

--nextPart2133046.HovnAMPojK
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 18 January 2021 09:14:54 CET Sven Eckelmann wrote:
> The device was just performed a cold boot and I have no idea why the firmware 
> reports this mac address. But the caldata is attached for further inspection
> to the next mail (which Kalle has to approve manually). 

See the attachment of this mail.

Kind regards,
	Sven
--nextPart2133046.HovnAMPojK
Content-Disposition: attachment; filename="caldata.bin.zip"
Content-Transfer-Encoding: base64
Content-Type: application/zip; name="caldata.bin.zip"

UEsDBBQAAAAIABdrL1LNq/TsKSEAAAAAAgALAAAAY2FsZGF0YS5iaW7tnQl0VNeZ52+9VypKoiyE
kFRVQqBdKojjxoBYJIEWJCTQgiiV9hUhFmMWAQZkFgNiMZgdZEMcx5aJ487JcXc7xJ34zHjBIUun
s55M2h2nz3SSjpNObzOa7p45zpyMNf/v1auqW0K2ntBSQny/+q7qfve979777v3u8mpRmYTZLIhj
f/G0w/zRB28+suQn2t+/EurR6MX12t8G7W+j9rdJ6Fx2CWESiylqEhKXoSlBKZ9Iu6GzpjTRppna
I8u0UnvkmLK1R55pqfZYqT8vN+Vqj6Wmxdojy7RQe0SZEvRHLkK8v91tWs4Uo5zpmXKmZ8qZnlfq
z5QzPVPO3vMXSr1nEiaTElCnjW9rMKFCEX/Uer1mzt3HZuBhPB+Jl0dZqU/hK0qwPpI6EhNVz/ul
PVVhU4Y/K0RYLOLYX4uf3v6bYx/k/3fx69sfjjyLGzpjWS2Tw6pO5jCaazOLBPNYtROWkI+CwoOM
Gdf/aWEqUV7lqW9u79x6/nLvjRf6Xvnya6+/8ebb7337ez8cdJ7ZGhFOREREWOnZTH8tCKOvQuPo
s2CGIEzcDqwXtKApBmIMM4mwiB+wXzJThmnC4b1zN5nE0f47M/JSJWb8XjHhVl4KZXTqDECHYWQN
C8rtEzKBpRzuLZOR1WQssIofPE/PXQfP3rj52oCOEKnfFCL5bSFmf0mIuONCzMSGwbYQ50dhW/I/
B4bNN/U92L8F+y8KYT8tRHSrEJErYW+D/b8asL8D+3eEiO9D+SdQfgvKXwz7aNz7/cqAva/+vvLb
UH4e7B9C+f82vP2TIPVdIVLoGm4ij1N6Hvl6Hkau4R1vmI1rsOMaopthnwv7CNj/swH723ob+vqg
Se+DmbDvN1a+Vn9f+U0jK19rA7QhBX8eLVI//ouBOgy2v4c2SHlHb4MevQ0W6W3wv4yXn0B+gDaM
hh9HZsPeCvvfG2wDtCGFBPKDHv0aVujX8E8G6qDbj1kbNI+wDeT6H0P59Sh/uRARdtj/4wjb4GW9
HX2+FG6wDWQ/ODmoDYz40W19LLyqzwfNgfnA/O8jaAPU3/G03gbL0AZxI2iD/4o8EBL69DzIl3J0
XzKQx1j4gb8Neu69DeZgLDgwJ86i+Wwp2iAW9r811gbDnjTF4TbgNiC4DbgNCG4DbgOC28DbBsd3
13Qs96Suil0YSD+1s7p1ybqUlXGPBNIu723blFebudqxOJB25UDb1uza9JJo6bwX93nallal5Mf+
SSDt9HZP89KK5NzYz0i2uzdszPe4ihxSuRf3tnQuq04ripbOu753fUt+TcrK2M8G0s5sr2leVpGS
Gyed17unY2NBjXPRjGSp3D0NG5e4Uwuj50vXsWdDZ64nsyhGsvXWLyU39uFA2jWcV1DjKnYsCqT1
dXduza9PKohyBdLO7W7dmFOdUTRLKuPkDndzgSc5KL+re9s782tdxU6p/W4caN+yot61ZkamZLur
sWOZO61w5jyp3CeqmvOqk3LlOh/c0d65EvnJ/XF5f9PmnNrMUsdSwTCTgq6zN4e6Ubnr9epLly6J
q1evirNnz4q+vr7xrxgzKSl313dsPX/1hZuv3Xrz7Ts/HBhM2h0hUt4QYu5VIZzbcF9djftyrCGR
0fRZseHJ+JYQaV8XIuk67su3474a9jGY46NwTx1p4JMCGd/BPfnrQiRehv1O2NfCPgv2dtgbeLlX
K/8vUf6zsEf9HW7YPwr7WbA38C7O/PeRx220wU20wXG0QaMQsdmwx/VH/Hr41wTm/50Q6W/B/kuw
PwH7lsD1Rxh4TWHeL1D/d1F/lJ+A8u0NaP9Hve0fYeA1jfl/i/p/Uy//pF4+1rCoONj/zthrGkTa
d4VIRj/MfQ557IIf1KEeWPci0Q82A/2Qfhv9eAv9eEWI+K24jirUYwnq4UQe1uHt02CfQn7wOZQP
+ziyXwH7JNhHGigfbZD6NdjDj+Mf08tfarx8zQ+oHV+V2nGR3o4G+nH+B7ofkP0p2LeOrB80P3gP
foB+TIAf2ZvQ/ig/Mgb2/2mg/Pf18v8U5Z/Wy8/yXnuEgdcn/X6A8ZjyDeSB8eTcgX7AeIxGP0bi
OmwGx3Ma7JNu6OPZE2gHI+NZ84OvDvKDlffgB9d0P1iv+0E87A18bmTez1EHtGMy+mEO+tHRDPsc
2D6EdvwfBvoR80Ha27CHH8w5qdvneutuxD7z5973jhJfQfvBD+LID1C+bTrs/2ig/A/08uEHc+AH
jhZv+0VGwd7AeyZB88FX9flgpzQfOFAXy7DZBPvBjnvwA7RBCvpx7hV9XXLr82KUsXUpHetaKta1
xF74wePwA1oXlqP82cgjYnj7+eiH9Pd0Pzg5yA8MvH9G45l8MRn9OAf96MC6EpOt2xt478z1c+/7
V4kvo/2wLsTV4/qX4drhwxF/MDYfaX5MfvA0ysd8EL1A9wMD75n4/EB7HxPz+hysz86uQD0M+8F3
veu7fz6oGaEf0Jx8S/cDjOe49d7riMJ9aaSBj8umY3+Q+pej8AOaV7E+J39R78cmvR+nG+tHbX9w
W7fvgX2Dt3zN3sD7PuSHNCcmYT5JgB/a4YfRaL9I2l/8b4Prwm19PpL9YMYI54Nvox+wz5uLdnRi
nxfnCdTDZuATpTSWfPuD2bukfR78KNLAtwfSUX4qyk/EPjMefmSv8Y7HqDnethzW/s4o/eBHmJvp
/ew+5IHxGI9xEIdxEIXxaDPw3pe2T3tP32ceQxvCPpbWJRqPBt7Pn/83uv0r+j61QbI3sk/9Gezf
lcone6r/TGP2Q/oB7Q/QD9FZI/ADeTxu0/thmfF+8NtjXYqHH9qr9X5MMGjv8yOyR/3tHsmPDCws
838i+cEx+HKb1w+iaX9kYJ+n+cFttCHm9cQzqAPsY2kcYH9gM/C5Em2f+ba+z6T7jSb9fofuF35j
wP4Xkv2pQfcLBt8D9e8Tx8IPrul+sF73A4P7tKB93rZB+zwD+/10uu/8xqD5BPu0qLneNXo4ND9A
O6ahHZOwz5qNdozDPjka+3Xbhwb9AOMxFetzIubleNjH0v0GyrYZ2F/4/ahPt8e8Hkv9CB+2Gdhn
an7wziA/GMF9q98P0I8p6Me51watC9QOBu6//ePxWWk8Z+vj2cC87nv9wL/PrAnctxl5/cF/vwH7
eKxL9tqR3XfO/yn8AHmkviytCzQfWQ2uC3Tf+Y7uB/Cj+GbdD2wG/cBnj35MRD/GYz6IpfkAc6HN
yP7ig0GvX/jmk1nG5hO/Hwx+Hck9steRRu0HWBvTMB8kofzZuG90VAXWNwPdGHj9YbAfJBr0A1qf
6TM+XxrUjzSeDe4TM+7o63uP93WomAX6vP4PBvcHvvKxT4xv1P0g3KAf/J13n6u9fnAPr18E+cHg
+7YR+IF/v385cP/vu28x9HrkN3U/wHw0+7F78AP5fkOu/0xj5Wv9QJ8zekUfj/J4NtIP+rpw1/4A
+3Wbgf36/P+G+eiOXj78KJ72eQv0+cjAZ6y0+eAdyQ9G+DqYzw+09d13/y2PZ4P7LP/6PHifZnB9
zkT56ZhPkmGfgPKdNd71MXq2ty8Ml3+v+4P3dT/4ku4H8vpu8L5P84M+yQ+WjMAPRruuDPaDe5wP
PvF1WaP7vG9J64J832ZwXdD8APuTZNgnwN7p8baDYT/4pNcPDN5vaOOR2gD3/4kn9HkZ80nUdIPj
8Wf6vP7qEPOJkX4cvC406eUb3R+8P8T+gOxjRjgf0P3/V/X3ebqk+3+nwfv/7+jr8/V7nA++i7md
9okoPwHj2VnnnVej53jvvYYt3+cH97g/mf9j/b7Rt0/0zcu0Phv4HLZm/67uRz26Hy0YQT/+WN+n
fjFQvn+fauD9Ac0PYZ/yxcD7ZP59ooH7HZ8fDF6f/a+DYH8QaeC/g/hf173H+8bR7hO1+ezWKN5n
+qHej/e6P/ixd13xrQtBryMZeR3oR5L908HriqHXoX7mff0gGfZzjqH8du/1j/R9pmFPZKY07AcM
wX7AEOwHDMF+wBDsBwzBfsAQ7AcMwX7AEOwHDMF+wBDsBwzBfsAQ7AcMwX7AEOwHDMF+wBA+P7jy
+cZnsg+lb7NL/xD+yMmqJ/K2u5od5YG0o093Hs3bmVQbVxpIO3m+syd/j2uj0x1I6z3X+GTOtrRG
+5pA2uETyO/xxGqnlN/TZ2q7lz6W2iDn9+LFDYdzd2S0OCoCaVdfary4/Kn0XXGtUl3OrO9etDWp
bsbKQNqVS41Hc3altc0qCaRduFpzfMnu+Hr6DLWP0ydr9i3ZlOKxFwfSLp9q3p+zOc3jWB1Ie+Fc
5+H8x11NzrJA2qnTDQeWbUmttUt1fu7Flgu5RzJ30OeEfTx1qmpf/k5Xq1O6ji9c6jia1+Vqi5Xq
97lrLcdzdmd00Ge4fFy/0H5kxY70ZmdlIO3YSfe+rE2u5piiQNqZc3WHsh5La4pdG0j7/EX00a7M
llnSdRx6bsPFhfsTNzvb5Pq59+XvCK7f2bO1Ty7fhv6Q+u353pYTOXsyNs6S2+BkHbVfTazUfhdP
NOzN7kytjlsVSHv2TFv38i0Z9Xbpenufbu3O3ZpRZ5fqd/yG+0zWgaQtsfXS9Z5ev79gZ2KNXL/T
Z2qfXPpYSpC/vNDbfmLFXtdGh+R/l0607M3ZOLdcrsv1ng17VnZkuO0FUtrJ9ieyN2Z4Yguluhz1
dC1qTVkXK/nV2d76k0ufSOmg7/X46/K058CSLcm1cdK1vXih80j+zqSgduntbepZvjctqH7Pdrdu
za1PL3Euk8rYVdeetS416H9cPdvd9lhOQ0apXfrfS9dgm9OQXmqXbM/1Np5avi91I33vx8fFZ5oO
ZqMvHZJvvHh+w6H87fBnaQy+8FzryZwnMjc5pGu7eKC0LbsubbVDKuP0ztq2xRUpefL/zLp2sGVb
dlN6mX15IO25I207VrRklNtz5TZoP7ViX3qnU6rf5WdaUL+0BrtUv95n1u7O3ZYeVOeDFzacWrkv
c7Nse3Zf3aZlNSlF9F0zHyd2FNYsLHMVOaX/rXVuf/2mpTWpxbHS/7N66cjG7fktmeUx0nnXrrWd
yNmb3iG3wfXzbYdzt6c3yfPf2dM1+5dtTqmR54gTl6qPZu1Kao1dF0i70N2wZXl9aoncLj3b3c0L
17pWyfU7ube6Y0l1SiF9htTHkT3rNxY0Ja9ySLa9V1t7cvakb5B96PnzGw+v3J4R1JdHjm/sztua
VBUr+fiZS7VHl+5KbrVL9bt6uHV7dnN6mWNFIO34nuqOR6tca+j7Nj6O7XFvWOR2lcZK9XvpqfWb
C1pdFU6pfy9caexZvie1PU6qX8+Z6u6FW11tMdL4eOlc65O5j2U2OKXx23u2+fjyPentdsn28uFm
1C+tTPah4zvdbY9WuFY7s6S03dUbFq13lcp17jvi2fRodWZ5rNTOp87VHl66PbnJLrXViVPr9y2m
+VSaI54/3fxEbmdGTZw0x5670HAke2dKi12aiy8cbtye3YL6Se3Xt9/dVlDnWi2Pj54nqjuzPJll
cl169nk2P+pJXi2330tXO46v3O3a4JDWqBvn2g+teDyjUV57Pn+qeW8u5iuHVOenzlUdysP8Fyed
d+1g67acxvS1jpxA2ot7N3bmeYL976VDVR0FTRlr5P/T13do4+N5TclFzmypXS6XHcjtSm93SD7U
d2H9voIdmUHr0bGnOvfnbU6qjMkLpJ067zm8BG0fJ7X9je6OrSsaMkudko/37e7cUOBOzp4l/R+8
E12e9qxB//fvC6hffmPmWrl+F5+pw7qQVi+vCzee6Ti4AnPJzPxA2tXjTV05G9KrnNL4eOqMuzu/
K6kuRrY9tOHxFRgf8hzR01Xdnl+fku+U5+IDrVuy6zJKHNI8dP1Ye9fK9swqh7R+MAzDMAzDMMxk
wt1x9eatOwPDf3FteMb9N+OuXr165coVIZ7t7e29dg17f3DhAu59jxwG4106wzAMwzAMwzAMwzAM
wzAMwzAMwzAMwzAMwzAMwzAMwzAMwzBjRbhwab+mpZjDrBG2yBlRM6NnxcTG2R3O+NkJc+YmJiWn
pA6AacPgzS1GJIkFYpnIF6WiStSLdrFVdIlucUycEZfFDdEnvixeF2+K2+KvxE+CHj8Xb+HoMdgs
EFZx9w8L9XUWuJxaLC09TRbRiPNN2i8pof5R0YMrn5aekemaN39yXcO8eS5XRobvItLEPP81MExa
WiokPSU5OTUlOSV5kDr+x9PT0yBQklKTkTBIHf/jjM5cWbGBUFVkOFRVDQOhrsY4EyHM2hzddfYL
r6WOklBfS6gpr2/eer7vje89+oAT6n5gQgvtS0NdB4ZhjDMd93nEwoFPf3jaz9945fW3vzfW5y0b
CDwOnr0xf6QTiE2YY+i53IvvuVR/Khr8nJ+7bNl9Gx/rzmeYKULVcJSXlnKc4xMSZ3/k+GSKsz9y
fDLFQ71ZYBiGYRhmSvCQ+P01elYVIUyKzWRSFASTyaQiriqmT7M1WXCOBSdbcP40xKcNc74V51hx
vhXnhyMe/unnd92U4q8NHc+bogj0hUBfCDSXQF+IYfpCoC8E+kKgLwT6QgzTFwJ9IdAXAn0h0BeC
++ITURTbDEVRVG1ooC8QLMpw/TEGKBaUSyWhTxX0KYKCYFaG69vRlmtFuVaUC99Qwm3TlGF8Y6x4
kH2MGT0qxikGqYqhaVIxThEs6gSMUxXjVMU4VTFOVYxTBAXBrI7zOFUxTlWMUxXjVMU4VSdonB68
oT/fDH4Odf8/KExEH48FoW6nwYS6PZgAofYFZvJixzpuxzpuxzpuxzqOYLFPwDpuxzpuxzpuxzpu
xzqOoCCY7eO8jtuxjtuxjtuxjtuxjtt5v83cBzgwTh0Ypw6MUwfGKYLFMQHj1IFx6sA4dWCcOjBO
ERQEs2Ocx6kD49SBcerAOHVgnDomeL+txW8OHQ+1LzCTl4nwUWZsCbXPjBehblcmQKh9gZm8hNo3
H3RC3f8PCqHuZ6OEup0GE+r2YAKE2heYyUuofZMJEGpfYCYvofZNJkCofYGZvITaN0OO0m8K/mxq
v7HPpxrFgvyCPsvab+zzrEaxIr+gz772G/r8q1HKm9/+4ZDp598Y+vzzbw6ZHmo/Z5ipjIJ5DEFB
MCN8pGBOQ4gMfM67nwI0HFf7uyfyc9/jgWLpHwj+PHk/BQXBjGBFiEJon8jPmY8nihXXG/Q59v6j
E/lZ9omG1x2GYRiGYe4XVOzDET4O/u5WPwUo/WaE7on8Ltd4o2IfHvx9sX4KCoIZwYoQhdA+kd8j
G09U7MODv6fWf3Qiv6s20VS2vvvdu9Iu/vnd5138+l1poR6LDMMwDBNKzEr/gBn7QTP2g2bsB83Y
DyIoCGaEbjP2gwgW8xTYDxJm7AnN2BOasSc0Y09oxp4QQUEwI1gRohDazdgTIiDdhvT799rN2BOa
sSc0Y09oxp7QjD2hGXtC8xTdE7o77gTiV29K8Vv+eKjHHMMw9x8TOpExzCQg1GOOYZj7j1DPWwwz
0YR6zDEMc/9hUfoHLIpthkVRVO1ffKv9FBQEM0K3RbVBt1ksU+Q1WIsF12vB9VpwvRZc77R+CgqC
GcGKEIXQbpmG655mQ7oN6ffvtVusuF4rrteK67XiesP7j1rCbdMsU/Q12MbnAyHUY+tBIdR9PtUI
dX8y9zeh9t+pQKj7kBkZofaXqUCo+5AZGaH2l6lAqPuQGRmh9pf7iVD31WDsSr8JQUEwI3xkV2zQ
bZGB3wDop6AgmBG6J/I3AcYDu6V/IPi3BvopKAhmBCtCFEL7RP4GwXhit+J6g37joP/oRP7OwUTD
38VmGIZhGOZ+wYF9OMLHwb/r009BQTAjdE/k7/yMNw7sw4N/S6ifgoJgRrAiRCG0T+RvDI0nDuzD
g3/DqP/oRP6O0UQz1HextfQhvo/tTb/7O9lEqMclwzAMwzBTH6fSP+DEHtyJPbgTe3An9uAICoIZ
oduJPTiCxTkF9uCEE/twJ/bhTuzDndiHO7EPR1AQzAhWhCiEdif24QhItyH9/r12J/bhTuzDndiH
O7EPd2If7sQ+3DlF9+Hy99+D0qXvwgen3xoyPdTjkmEYhmGYqc+YbYAYZhIQKcxWeh543RajmDtF
11khTEIRZmEV18HLwHfum2A0aVOpDDPKqL/x5W9zGZ+eJhiGYZhJzQxhdow2jz+E/yGcngumF0wP
PCdbk7HDeCj8oXDv30pLpcU0zTRttKVxeWNdHhN68oZ4bPp/X/v4ax83DMiPWHH3Yyz5s4G7H0Od
96eiGo/5QQ9vXYe3ZRiGedDonnnDdnFmx0MUjNrIK8Fws70843rnZ++MPMpqMwzDMAzDMAzDMFOI
KP3zAAzDMAzDPHjMFNsntLxo4dG+59Su/GrM8z6qjP1L3+NRz/HIc5a+n0uqHPr4m9O9z1PyS2YM
wzAM84ATI8wJ9GwWS0XBahJXnxBW0spJSLOJRlGkCWlRIlsUVJOQ1qvgzDUkpCWJLlHgJiFtkVgg
CipIXDFCxNKZdSR0LE2kioIaEtJcVJ6HhLREsmskIe1hkSMKq0lIWyAaRGEpCeW5ULhFYREJHVss
kkVhIQlpXcizsIGEtGWkFZOQ5hErRGEjCWm5uKLCChLS8ulMDwlpRaJFFK4jIW01HSsgIa1c5IlC
Nwlp7aJJFFaSkNZJZ5aQkFar4hpWk5D2BI6VlZKQdhh9sKqAhLQzuNqyBhLSzkNbtZrE5UJbw85T
RELHbojfiFXlJKS9IOrEqkoS0m6SXT0JaV8hbR0JaW+R5iahFjxmgraGhI69ixJK3SSkfQvaqgYS
0r5PWiMJaT+BVlRGQtrP4BVFFSSkvU/aOhLSfoHyileRaD2mLhHFJSR07O9xP1FdS0LH/gl5FheT
0LF/JM1DQtr/gbZ6DQlp/5c0NwlpH0MrWU1CmmJaKqpWk2i+a1ogSopJSIvBsaJiEs1bce0lpSSa
R+JYyRoSzetIc5NoXkdaOYnmZ6ZsUVJEonkWHasi0XyJjtWQaL5ExzwkpJWacKCBRPMenFnqIdE8
EnUprSQhrZ60MhLSmpFLaQ2J5mfQ1lSTaH5mahBrKklI22qqFWuKSKg9u+jM9SSa15FWTEJat2mJ
WFNOovkgHfOQkHbS9KFYW0FC2mVToVi7joS0iyZVlDWSwCFFr2m9KCsmoWPPm1pFmZuEtBdRQlkd
CWmvoYTyWhLSXsX1lReSaP5Jx6pJSPs6aWtISHuTNA8Jaf+FtBoS0t5BLhXrSEjLVJeKijIS0r6D
MyvqSEj7a5NTVDSQkPYjU5OoqCXRvJXO9JBofaRki4pSEs136dh6Es1bSXOTkPYr0mpISPsL+GCD
h4S0D015oqKehLQS5Lm6goS0fye7IhLS/pW0VSSk9dMVVZKQ9h90rJiEtI/QnhUFJKSZld+KygIS
zcuV34jKKhJthsZMW1nu06Jp3q0kIW2+kicqG0lIW6K0iMoSEm2uo2uvIiHtEWiVa0hIK6Q815GQ
JqCtqyAhba1SI6rKSEhbA7uqOhLS1im/E1UFJNo8qOSIqhISzctJayDRvJy0YhLNy0krJdH8GuVV
lZOQtp00Dwlp+6k8NwlpB5V5Yn0BCWlP4Ux3MQlpPaStIyHthLJCuGtISDuN8tx1JNq8izMLy0lI
u6a0ibJKEtKeg1a+ioS06zizYjWJNgKoZhUk2giAVruKhLQ98M+6ahKay7+CY9UFJHTsz5UPRXUl
CWmvUz2rSTQvR82qS0i0GZrsykhIe4+0NSSaz+PMxgISbU7GseJqEs0j6Uw3iTamMSeXl5HQPNFP
x4pJ6Nh/QltVSqJdA9ZGTx2J5gWqW3gaSUj7I8rzlJJoPoHr85SQ0PXZsOJ5PCTavItZ31NJQpqD
znSTkJZAZ64i0eZkaDUlJNqcrK4UNQUkml/jWEExCWnZyKWkkEQbt2qcqKkmIa1RTRY1DSSaZ6H0
mkYSLU/UuraGhLRWNUXUFpOQdpuOVZK4qoRwq9midg2J5nXUf6tJSDugqqKhmITmwR+gzRrrSOjY
GdOvxdoqEm1mmCFrDDOZUSFRQphm4jlJmEzJwoQRYrJkY1+VIxQ1TyiWaKGaUkWYGiPCTHHCgrV1
mvqhsKq/E+EYBxEYbdPVBZgBVoiHMH4j1QwxQ3Vh9GaKmeo8EY05ZJZaI2ZZijEv1IoYS6GIVZtE
nNoi7GorZoc24VTXiXjsLWarjZgf6sQctUHMVbtEovorkTRtt0i2/FakqL8RqWqPSAv7nEg3nxHp
YX8rMsJ+KTLD2sW8iA0IHQgbhSt8E0KncFk3i3nWxxC2iHnhWxG2IWxH+LV4OCzU7T7V6Qj/crhL
zPXHYvyxNC12y592y3/eraCjdsQ+px9VxFfC3wmPQVq+HosRhfdQq0dmPTUrRiu3XIslI/bqrH/Q
0xbG9MRU4Q7FF7P7Y4Gjc/0xhz8WLZ+n+G21mEu3+GlMH44qeoxsexCj86x6LMYfi/bH5vpjdr/F
XH/M4T+a5k+LkY5KaYq/NC3m0nLeE9sR16fl4o1R/bwxKsN3VPjTfOfZJQuKVfqPVgalzdZjLumo
wx+L98e8+b0fW6UfpZi3BhRL02LfjK3Sc4n255LhLy3Dn8vH+nnRcR1x3vy8McrPG6P8tsR9P87b
pt7YXH8sxh9LltIUPebwp3lz+Y+4GO0qvbG5elqVFIv0x7w5f8N/9FKc18e/H/dL3faX/lweJLD6
WEx36YpfXyDoXSnVr+cjKMJilXWTsAw63zxID0z4A5puCtIVEfjeLOkq9PB7vqJgokyKRRVqZFaQ
bg7SzWJazOysgC7XLworMK43S84vDOfPezRLsrcE2VN+n13ut0drPGSfmyXrFr++QFEE1SdF+PQw
OiNSiMBxRVij/Dq9hijM0XP89poembHcp0dAD5uRlhOwJz1psaybIxNXBuvJeb780RvCf7m6nh+k
w2KxXD8V+S8Jqu9MfwYLwqg9wiJTfPXV2sc8MyVfLn96fHpuUHs8XBCUvznyT3ztb/bqSwP9Q3q0
rIcJddb8hVmSbo79zKLsoPNXSPmbRYQzcWng+lQR7vBdT752/QH/zVe95bskPYxeINBTSDeJTP/5
A1p72ZbJuipsCf4EhmEY5gEiVni059zc3DENceKtEF/Z6LCLP4a6CiHFIc5rW+/5Aw8PzNcejwx8
Juj5s3r6w4OePzPoeXT2nvbzN155/e3vcT2C6/HwwMgeB8/eCLVLjQqnaPZFTSaTopTXbz3f98bQ
v6E6iK6TQ/8L+SDihXfXnJCQmkHh086dLT5UP+04wzD3PwmialWo68AwDMMwDMMwDMMwDMMwDMMw
DMMwDMMwDMMwDMMwDMMwDMMwDMMwDMMwDMMwDMMwDMMwY8n/B1BLAQIUAxQAAAAIABdrL1LNq/Ts
KSEAAAAAAgALAAAAAAAAAAAAAACkgQAAAABjYWxkYXRhLmJpblBLBQYAAAAAAQABADkAAABSIQAA
AAA=


--nextPart2133046.HovnAMPojK
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--nextPart2133046.HovnAMPojK--




