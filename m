Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hazCn-0006nr-1T
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 09:06:06 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CCD4C6019D
 for <ath11k@lists.infradead.org>; Wed, 12 Jun 2019 09:06:03 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: ath11k-check script pushed
Date: Wed, 12 Jun 2019 12:06:01 +0300
Message-ID: <87h88vfa12.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

Hi,

This is the script I use to check ath11k after I have applied the
patches:

https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath11k/ath11k-check

Currently I run it as 'ath11k-check --fast' to avoid running checkpatch.
But once the checkpatch warnings are fixed I will run it as
'ath11k-check'. Also I'm hoping to enable the extra W=1 warnings at some
point, in general they are also quite useful.

The help switch some more info about the script:

$ ath11k-check --help
usage: ath11k-check [-h] [-d] [--fast] [--extra] [--no-filter] [--version]

ath11k source code checker

Runs various tests (gcc, sparse and checkpatch) with filtering
unnecessary warnings away, the goal is to have empty output from the
script.

Run this from the main kernel source directory which is preconfigured
with ath11k enabled. gcc recompilation is forced every time,
irrespective if there are any changes in source or not. So this can be
run multiple times and every time the same warnings will appear.

Requirements (all available in $PATH):

* gcc
* sparse
* checkpatch.pl
* gtags (from package global)

optional arguments:
  -h, --help   show this help message and exit
  -d, --debug  enable debug messages
  --fast       run only tests which finish in few seconds
  --extra      Run extra checks like W=1
  --no-filter  Don't filter output with regexp: '/ath'
  --version    Show version information about dependencies

Installation:

As checkpatch is evolving this script always matches a certain version
of checkpatch. Download the checkpatch version from the URL below and
install it somewhere in your $PATH:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl?id=12c253abb9c9d8e01d9365fc8cbde4688731f401

Alternatively if you want manually run checkpatch with the same
settings as ath11k-check uses here's the command line:

checkpatch.pl --strict -q --terse --no-summary --max-line-length=90 --show-types --ignore MSLEEP,USLEEP_RANGE,PRINTK_WITHOUT_KERN_LEVEL,NETWORKING_BLOCK_COMMENT_STYLE,LINUX_VERSION_CODE,COMPLEX_MACRO,PREFER_DEV_LEVEL,PREFER_PR_LEVEL,COMPARISON_TO_NULL,BIT_MACRO,CONSTANT_COMPARISON,MACRO_WITH_FLOW_CONTROL,CONST_STRUCT,MACRO_ARG_REUSE,OPEN_ENDED_LINE,FUNCTION_ARGUMENTS,CONFIG_DESCRIPTION,ASSIGNMENT_CONTINUATIONS,UNNECESSARY_PARENTHESES,MACRO_ARG_PRECEDENCE,BOOL_MEMBER foo.patch

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
